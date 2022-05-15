# frozen_string_literal: true

require "dry/container"

module Pennyworth
  module CLI
    module Actions
      # Provides a single container with application and action specific dependencies.
      module Container
        extend Dry::Container::Mixin

        config.registry = ->(container, key, value, _options) { container[key.to_s] = value }

        merge Pennyworth::Container

        register(:config) { Config.new }
        register(:encodings) { Encodings.new }
        register(:git_hub) { GitHub.new }
        register(:http_statuses) { HTTPStatuses.new }
        register(:ruby_gems) { RubyGems.new }
        register(:standard_errors) { StandardErrors.new }
        register(:system_errors) { System::Errors.new }
        register(:system_signals) { System::Signals.new }
        register(:text) { Text.new }
      end
    end
  end
end
