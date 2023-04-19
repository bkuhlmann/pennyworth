# frozen_string_literal: true

require "sod"

module Pennyworth
  module CLI
    module Actions
      # Handles the system errors action.
      class StandardErrors < Sod::Action
        include Import[:kernel]

        description "Render Alfred standard errors script filter."

        on "--standard_errors"

        def initialize(processor: Processor.for_standard_errors, **)
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
