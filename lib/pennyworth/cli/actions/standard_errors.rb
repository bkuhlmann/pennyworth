# frozen_string_literal: true

module Pennyworth
  module CLI
    module Actions
      # Handles the system errors action.
      class StandardErrors
        include Pennyworth::Import[:logger]

        def initialize processor: Processor.for_standard_errors, **dependencies
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
