# frozen_string_literal: true

require "sod"

module Pennyworth
  module CLI
    module Actions
      module System
        # Handles the system error action.
        class Error < Sod::Action
          include Dependencies[:io, processor: "processors.system_error"]

          description "Render Alfred system errors script filter."

          on "--system_errors"

          def call(*) = io.puts processor.call.to_json
        end
      end
    end
  end
end
