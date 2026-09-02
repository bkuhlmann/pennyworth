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
                  .with_object([]) { |row, entries| entries.append parse_elements(row.children) }
      end

      private

      attr_reader :parser, :model

      def fetch uri
        http.follow.get(uri).then do |response|
          [200, 301].include?(response.status) ? response.body.to_s : Core::EMPTY_STRING
        end
      end

      def parse_rows page
        document = parser.parse page
        rows = document.xpath "//tbody/tr"

        return rows if rows.any?

        document.xpath "//section//ul/li"
      end

      def parse_elements elements
        case elements
          in Nokogiri::XML::Element => item, Nokogiri::XML::Element => description
            build_record item, description
          else build_reference_record elements
        end
      end

      def build_record item, description
        link = item.at_css "a"
        uri = %(#{settings.htmx_site_uri}#{link["href"]})

        model[label: item.text, description: "#{description.text}.", uri:]
      end

      def build_reference_record elements
        item = elements.shift
        path = item.attribute("href").text
        uri = %(#{settings.htmx_site_uri}#{path})
        description = elements.map(&:text).join.strip.delete_prefix("- ").capitalize

        model[label: item.text, description: "#{description}.", uri:]
      end
    end
  end
end
