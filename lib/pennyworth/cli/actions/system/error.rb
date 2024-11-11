# frozen_string_literal: true

require "sod"

module Pennyworth
  module CLI
    module Actions
      module System
        # Handles the system error action.
        class Error < Sod::Action
          include Dependencies[:io]

          description "Render Alfred system errors script filter."

          on "--system_errors"

          def initialize(processor: Processor.for_system_errors, **)
            super(**)
            @processor = processor
          end

          def call(*) = io.puts processor.call.to_json

          private

          attr_reader :processor
        end
      end
    end
  end
end
