# frozen_string_literal: true

module Pennyworth
  module CLI
    module Actions
      # Handles the system errors action.
      class StandardErrors
        include Pennyworth::Import[:kernel]

        def initialize(processor: Processor.for_standard_errors, **)
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
