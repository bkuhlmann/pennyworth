# frozen_string_literal: true

require "core"

module Pennyworth
  module Loaders
    # Loads RFC records by scraping web page.
    class RFC
      include Dependencies[:http, :settings, parser: :ox]

      def initialize(model: Models::RFC, **)
        @model = model
        super(**)
      end

      def call uri
        read(uri).each.with_object [] do |row, entries|
          next unless row.locate("td") in Ox::Element => label,
                                          Ox::Element => description,
                                          Ox::Element => published

          entries.append record_for(label, description, published)
        end
      end

      private

      attr_reader :model

      def read uri
        http.follow.get(uri).then do |response|
          [200, 301].include?(response.status) ? parse_rows(response.body.to_s) : Core::EMPTY_ARRAY
        end
      end

      def parse_rows(document) = parser.parse(document).locate "*/tbody/tr"

      def record_for label, description, published
        prefix, number = label.locate("*/span/span")
                              .reduce([]) { |all, element| all.append element.text }

        model[
          number: number,
          label: "#{prefix} #{number}",
          description: description.text,
          published: published.locate("span").first.text,
          uri: "#{settings.rfc_site_uri}#{label.locate("*/a").first.href}"
        ]
      end
    end
  end
end
