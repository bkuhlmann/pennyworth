# frozen_string_literal: true

require "sod"

module Pennyworth
  module CLI
    module Actions
      module System
        # Handles the system errors action.
        class Errors < Sod::Action
          include Import[:kernel]

          description "Render Alfred system errors script filter."

          on "--system_errors"

          def initialize(processor: Processor.for_system_errors, **)
            super(**)
            @processor = processor
          end

          def call(*) = kernel.puts processor.call.to_json

          private

          attr_reader :processor
        end
      end
    end
  end
end
