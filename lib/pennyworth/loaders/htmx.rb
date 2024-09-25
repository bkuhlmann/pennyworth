# frozen_string_literal: true

require "core"
require "ox"
require "refinements/string"

module Pennyworth
  module Loaders
    # Loads htmx documentation by scraping web page.
    class HTMX
      include Import[:http]

      using Refinements::String

      PARSER = Ox.tap do |ox|
        ox.default_options = {mode: :generic, effort: :tolerant, smart: true}
      end

      def self.text_for element
        parts = element.each.with_object [] do |item, content|
          content.append item.is_a?(Ox::Element) ? "`#{item.text}`" : item
        end

        parts.join.up.delete_suffix "."
      end

      def initialize(parser: PARSER, model: Models::HTMX, **)
        @parser = parser
        @model = model
        super(**)
      end

      def call uri
        read(uri).each.with_object [] do |row, entries|
          next unless row.locate("td") in Ox::Element => item, Ox::Element => description

          entries.append record_for(item, description, uri)
        end
      end

      private

      attr_reader :parser, :model

      def read uri
        http.get(uri).then do |response|
          [200, 301].include?(response.status) ? parse_rows(response.body.to_s) : Core::EMPTY_ARRAY
        end
      end

      def parse_rows(document) = parser.parse(document).locate "*/tr"

      def record_for item, description, uri
        model[
          label: (item.locate("*/code").first || item.locate("a").first).text,
          description: "#{self.class.text_for description}.",
          uri: item.locate("*/@href").first || uri
        ]
      end
    end
  end
end
