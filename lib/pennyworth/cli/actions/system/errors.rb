# frozen_string_literal: true

module Pennyworth
  module CLI
    module Actions
      module System
        # Handles the system errors action.
        class Errors
          include Pennyworth::Import[:logger]

          def initialize(processor: Processor.for_system_errors, **)
            super(**)
            @processor = processor
          end

          def call = processor.call.to_json.then { |json| logger.info { json } }

          private

          attr_reader :processor
        end
      end
    end
  end
end
