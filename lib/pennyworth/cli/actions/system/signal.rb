# frozen_string_literal: true

require "sod"

module Pennyworth
  module CLI
    module Actions
      module System
        # Handles the system signal action.
        class Signal < Sod::Action
          include Dependencies[:io, processor: "processors.system_signal"]

          description "Render Alfred system signals script filter."

          on "--system_signals"

          def call(*) = io.puts processor.call.to_json
        end
      end
    end
  end
end
