# frozen_string_literal: true

module Pennyworth
  module CLI
    module Actions
      # Handles the encodings action.
      class Encodings
        include Pennyworth::Import[:logger]

        def initialize processor: Processor.for_encodings, **dependencies
          super(**dependencies)
          @processor = processor
        end

        def call = processor.call.to_json.then { |json| logger.info { json } }

        private

        attr_reader :processor
      end
    end
  end
end
