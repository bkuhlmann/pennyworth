# frozen_string_literal: true

module Pennyworth
  module CLI
    module Actions
      # Handles the RubyGems action.
      class RubyGems
        def initialize processor: Processor.for_gems, container: Container
          @processor = processor
          @container = container
        end

        def call endpoint
          processor.call(endpoint)
                   .to_json
                   .then { |json| logger.info { json } }
        end

        private

        attr_reader :processor, :container

        def logger = container[__method__]
      end
    end
  end
end
