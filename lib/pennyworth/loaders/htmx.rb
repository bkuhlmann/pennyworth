# frozen_string_literal: true

require "core"
require "nokogiri"

module Pennyworth
  module Loaders
    # Loads htmx records by scraping web page.
    class HTMX
      include Dependencies[:http, :settings]

      def initialize(parser: Nokogiri::HTML5, model: Models::HTMX, **)
        @parser = parser
        @model = model
        super(**)
      end

      def call uri
        fetch(uri).then { parse_rows it }
                  .each
                  .with_object [] do |row, entries|
          row.children in Nokogiri::XML::Element => item, Nokogiri::XML::Element => description
          entries.append build_record(item, description) unless item.text.include? "Soon"
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

      def build_record item, description
        link = item.at_css "a"
        uri = %(#{settings.htmx_site_uri}#{link["href"]})

        model[label: link.text, description: "#{description.text}.", uri:]
      end
    end
  end
end
