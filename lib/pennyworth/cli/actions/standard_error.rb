# frozen_string_literal: true

require "sod"

module Pennyworth
  module CLI
    module Actions
      # Handles the system error action.
      class StandardError < Sod::Action
        include Dependencies[:io]

        description "Render Alfred standard errors script filter."

        on "--standard_errors"

        def initialize(processor: Processor.for_standard_errors, **)
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
