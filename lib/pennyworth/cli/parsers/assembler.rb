# frozen_string_literal: true

module Pennyworth
  module CLI
    module Parsers
      SECTIONS = [Core, GitHub, RubyGems].freeze # Order is important.

      # Assembles and parses all Command Line Interface (CLI) options.
      class Assembler
        def initialize configuration = Configuration::Loader.call,
                       sections: SECTIONS,
                       client: CLIENT
          @configuration = configuration
          @sections = sections
          @client = client
        end

        def call arguments = []
          sections.each { |parser| parser.call configuration, client: }
          client.parse! arguments
          configuration
        end

        def to_s = client.to_s

        private

        attr_reader :configuration, :client, :sections
      end
    end
  end
end
