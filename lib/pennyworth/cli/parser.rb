# frozen_string_literal: true

require "core"
require "optparse"

module Pennyworth
  module CLI
    # Assembles and parses all Command Line Interface (CLI) options.
    class Parser
      CLIENT = OptionParser.new nil, 40, "  "
      SECTIONS = [Parsers::Core, Parsers::GitHub, Parsers::RubyGems].freeze # Order is important.

      def initialize configuration = Container[:configuration],
                     sections: SECTIONS,
                     client: CLIENT
        @configuration_duplicate = configuration.dup
        @sections = sections
        @client = client
      end

      def call arguments = Core::EMPTY_ARRAY
        sections.each { |parser| parser.call configuration_duplicate, client: }
        client.parse arguments
        configuration_duplicate.freeze
      end

      def to_s = client.to_s

      private

      attr_reader :configuration_duplicate, :client, :sections
    end
  end
end
