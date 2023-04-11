# frozen_string_literal: true

module Pennyworth
  module CLI
    module Actions
      # Handles the text action.
      class Text
        include Pennyworth::Import[:kernel]

        def initialize(processor: Processor.for_text, **)
          super(**)
          @processor = processor
        end

        def call(content) = kernel.puts processor.call(content).to_json

        private

        attr_reader :processor
      end
    end
  end
end
