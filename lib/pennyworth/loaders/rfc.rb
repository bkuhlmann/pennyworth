# frozen_string_literal: true

require "core"
require "nokogiri"

module Pennyworth
  module Loaders
    # Loads RFC records by scraping web page.
    class RFC
      include Dependencies[:http, :settings]

      def initialize(parser: Nokogiri::HTML5, model: Models::RFC, **)
        @parser = parser
        @model = model
        super(**)
      end

      def call uri
        fetch(uri).then { parse_rows it }
                  .each
                  .with_object [] do |row, entries|
          row.children in Nokogiri::XML::Element => label,
                         Nokogiri::XML::Element => description,
                         Nokogiri::XML::Element => published
          entries.append build_record(label, description, published)
        end
      end

      private

      attr_reader :parser, :model

      def fetch uri
        http.follow.get(uri).then do |response|
          [200, 301].include?(response.status) ? response.body.to_s : Core::EMPTY_STRING
        end
      end

      def parse_rows(page) = parser.parse(page).xpath "//tbody/tr"

      def build_record label, description, published
        prefix, number = label.xpath(".//span/span").map(&:text)
        uri = label.at_css("a")["href"]

        model[
          number: number,
          label: "#{prefix} #{number}",
          description: description.text,
          published: published.text,
          uri: "#{settings.rfc_site_uri}#{uri}"
        ]
      end
    end
  end
end
