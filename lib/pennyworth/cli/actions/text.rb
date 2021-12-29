# frozen_string_literal: true

module Pennyworth
  module CLI
    module Actions
      # Handles the text action.
      class Text
        def initialize processor: Processor.for_text, container: Container
          @processor = processor
          @container = container
        end

        def call(content) = processor.call(content).to_json.then { |json| logger.info { json } }

        private

        attr_reader :processor, :container

        def logger = container[__method__]
      end
    end
  end
end
