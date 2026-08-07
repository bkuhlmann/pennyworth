# frozen_string_literal: true

require "core"
require "nokogiri"
require "refinements/pathname"

module Pennyworth
  module Loaders
    # Loads Rodauth documentation by scraping the web page.
    class Rodauth
      include Dependencies[:http, :settings]

      using Refinements::Pathname

      def initialize(parser: Nokogiri::HTML5, model: Models::Rodauth, **)
        @parser = parser
        @model = model
        super(**)
      end

      def call uri
        fetch(uri).then { parse_items it }
                  .each
                  .with_object([]) { |item, entries| entries.append build_record(item) }
      end

      private

      attr_reader :parser, :model

      def fetch uri
        http.get(uri).then do |response|
          [200, 301].include?(response.status) ? response.body.to_s : Core::EMPTY_STRING
        end
      end

      def parse_items page
        parser.parse(page).xpath('//*[@id="content"]//ul/li')
      end

      def build_record item
        link = item.at_css "a"
        label = link.text
        uri = %(#{settings.rodauth_site_uri}/#{link["href"]})

        model[
          name: Pathname(uri).name.to_s.delete_suffix("_rdoc"),
          label:,
          description: item.text.delete_prefix("#{label}: "),
          uri:
        ]
      end
    end
  end
end
