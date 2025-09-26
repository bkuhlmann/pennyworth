# frozen_string_literal: true

require "core"
require "refinements/pathname"
require "refinements/string"

module Pennyworth
  module Loaders
    # Loads Rodauth documentation by scraping the web page.
    class Rodauth
      include Dependencies[:http, :settings, parser: :ox]

      using Refinements::String
      using Refinements::Pathname

      def initialize(model: Models::Rodauth, **)
        @model = model
        super(**)
      end

      def call uri
        read(uri).each.with_object([]) { |item, entries| entries.append record_for(item) }
      end

      private

      attr_reader :model

      def read uri
        http.get(uri).then do |response|
          [200, 301].include?(response.status) ? parse_items(response.body.to_s) : Core::EMPTY_ARRAY
        end
      end

      def parse_items document
        parser.parse(document).root.body.div.ul.nodes
      rescue NoMethodError
        Core::EMPTY_ARRAY
      end

      def record_for item
        link = item.a
        uri = "#{settings.rodauth_site_uri}/#{link.href}"

        model[
          name: Pathname(uri).name.to_s.delete_suffix("_rdoc"),
          label: link.text,
          description: item.text.delete_prefix(": "),
          uri:
        ]
      end
    end
  end
end
