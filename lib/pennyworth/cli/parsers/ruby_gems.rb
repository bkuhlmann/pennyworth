# frozen_string_literal: true

require "core"

module Pennyworth
  module CLI
    module Parsers
      # Handles parsing of Command Line Interface (CLI) RubyGems options.
      class RubyGems
        def self.call(...) = new(...).call

        def initialize configuration = Container[:configuration], client: Parser::CLIENT
          @configuration = configuration
          @client = client
        end

        def call arguments = ::Core::EMPTY_ARRAY
          client.separator "\nRUBYGEMS OPTIONS:\n"
          add_owner
          client.parse arguments
          configuration
        end

        private

        attr_reader :configuration, :client

        def add_owner
          client.on "--owner [HANDLE]", %(Set owner. Default: "#{owner}".) do |handle|
            configuration.ruby_gems_owner = handle || owner
          end
        end

        def owner = configuration.ruby_gems_owner
      end
    end
  end
end
