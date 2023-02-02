# frozen_string_literal: true

module Pennyworth
  module CLI
    module Actions
      # Handles the RubyGems action.
      class RubyGems
        include Pennyworth::Import[:logger]

        def initialize(processor: Processor.for_gems, **)
          super(**)
          @processor = processor
        end

        def call endpoint
          processor.call(endpoint)
                   .to_json
                   .then { |json| logger.info { json } }
        end

        private

        attr_reader :processor
      end
    end
  end
end
