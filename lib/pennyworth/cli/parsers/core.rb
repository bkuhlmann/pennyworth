# frozen_string_literal: true

require "refinements/structs"

module Pennyworth
  module CLI
    # Handles parsing of Command Line Interface (CLI) primary options.
    module Parsers
      using Refinements::Structs

      # Handles parsing of Command Line Interface (CLI) core options.
      class Core
        def self.call(...) = new(...).call

        def initialize configuration = Configuration::Loader.call,
                       client: Parser::CLIENT,
                       container: Container
          @configuration = configuration
          @client = client
          @container = container
        end

        def call arguments = []
          client.banner = "Pennyworth - #{specification.summary}"
          client.separator "\nUSAGE:\n"
          collate
          client.parse arguments
          configuration
        end

        private

        attr_reader :configuration, :client, :container

        def collate = private_methods.sort.grep(/add_/).each { |method| __send__ method }

        def add_config
          client.on(
            "-c",
            "--config ACTION",
            %i[edit view],
            "Manage gem configuration. Actions: edit || view."
          ) do |action|
            configuration.action_config = action
          end
        end

        def add_encodings
          client.on "--encodings", "Render Alfred encodings script filter." do
            configuration.action_encodings = true
          end
        end

        def add_git_hub
          client.on "--git_hub", "Render Alfred GitHub repositories script filter." do
            configuration.action_git_hub = true
          end
        end

        def add_http_statuses
          client.on "--http_statuses", "Render Alfred HTTP statuses script filter." do
            configuration.action_http_statuses = true
          end
        end

        def add_ruby_gems
          client.on "--ruby_gems", "Render Alfred RubyGems script filter." do
            configuration.action_ruby_gems = true
          end
        end

        def add_system_errors
          client.on "--system_errors", "Render Alfred system errors script filter." do
            configuration.action_system_errors = true
          end
        end

        def add_system_signals
          client.on "--system_signals", "Render Alfred system signals script filter." do
            configuration.action_system_signals = true
          end
        end

        def add_text
          client.on "--text CONTENT", "Render Alfred text script filter." do |content|
            configuration.action_text = content
          end
        end

        def add_version
          client.on "-v", "--version", "Show gem version." do
            configuration.action_version = true
          end
        end

        def add_help
          client.on "-h", "--help", "Show this message." do
            configuration.action_help = true
          end
        end

        def specification = container[__method__]
      end
    end
  end
end
