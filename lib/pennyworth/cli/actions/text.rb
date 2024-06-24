# frozen_string_literal: true

require "sod"

module Pennyworth
  module CLI
    module Actions
      # Handles the text action.
      class Text < Sod::Action
        include Import[:io]

        description "Render Alfred text script filter."

        on "--text", argument: "CONTENT"

        def initialize(processor: Processor.for_text, **)
          super(**)
          @processor = processor
        end

        def call(content) = io.puts processor.call(content).to_json

        private

        attr_reader :processor
      end
    end
  end
end
