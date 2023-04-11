# frozen_string_literal: true

module Pennyworth
  module CLI
    module Actions
      module System
        # Handles the system errors action.
        class Errors
          include Pennyworth::Import[:kernel]

          def initialize(processor: Processor.for_system_errors, **)
            super(**)
            @processor = processor
          end

          def call = kernel.puts processor.call.to_json

          private

          attr_reader :processor
        end
      end
    end
  end
end
