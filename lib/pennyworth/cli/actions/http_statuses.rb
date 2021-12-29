# frozen_string_literal: true

module Pennyworth
  module CLI
    module Actions
      # Handles the HTTP statuses action.
      class HTTPStatuses
        def initialize processor: Processor.for_http_statuses, container: Container
          @processor = processor
          @container = container
        end

        def call = processor.call.to_json.then { |json| logger.info { json } }

        private

        attr_reader :processor, :container

        def logger = container[__method__]
      end
    end
  end
end
