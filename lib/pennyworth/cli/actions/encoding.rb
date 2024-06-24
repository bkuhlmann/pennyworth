# frozen_string_literal: true

require "sod"

module Pennyworth
  module CLI
    module Actions
      # Handles the encoding action.
      class Encoding < Sod::Action
        include Import[:io]

        description "Render Alfred encodings script filter."

        on "--encodings"

        def initialize(processor: Processor.for_encodings, **)
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
