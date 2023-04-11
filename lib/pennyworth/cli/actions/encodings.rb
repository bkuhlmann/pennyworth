# frozen_string_literal: true

module Pennyworth
  module CLI
    module Actions
      # Handles the encodings action.
      class Encodings
        include Pennyworth::Import[:kernel]

        def initialize(processor: Processor.for_encodings, **)
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
