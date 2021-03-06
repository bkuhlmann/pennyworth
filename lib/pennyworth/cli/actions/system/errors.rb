# frozen_string_literal: true

module Pennyworth
  module CLI
    module Actions
      module System
        # Handles the system errors action.
        class Errors
          def initialize processor: Processor.for_system_errors, container: Container
            @processor = processor
            @container = container
          end

          def call = processor.call.to_json.then { |json| logger.info json }

          private

          attr_reader :processor, :container

          def logger = container[__method__]
        end
      end
    end
  end
end
