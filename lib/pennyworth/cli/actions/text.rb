# frozen_string_literal: true

module Pennyworth
  module CLI
    module Actions
      # Handles the text action.
      class Text
        include Pennyworth::Import[:logger]

        def initialize processor: Processor.for_text, **dependencies
          super(**dependencies)
          @processor = processor
        end

        def call(content) = processor.call(content).to_json.then { |json| logger.info { json } }

        private

        attr_reader :processor
      end
    end
  end
end
