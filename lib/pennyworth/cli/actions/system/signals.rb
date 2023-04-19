# frozen_string_literal: true

require "sod"

module Pennyworth
  module CLI
    module Actions
      module System
        # Handles the signal action.
        class Signals < Sod::Action
          include Import[:kernel]

          description "Render Alfred system signals script filter."

          on "--system_signals"

          def initialize(processor: Processor.for_system_signals, **)
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
