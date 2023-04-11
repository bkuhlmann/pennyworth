# frozen_string_literal: true

module Pennyworth
  module CLI
    module Actions
      # Handles the RubyGems action.
      class RubyGems
        include Pennyworth::Import[:kernel]

        def initialize(processor: Processor.for_gems, **)
          super(**)
          @processor = processor
        end

        def call(endpoint) = kernel.puts processor.call(endpoint).to_json

        private

        attr_reader :processor
      end
    end
  end
end
