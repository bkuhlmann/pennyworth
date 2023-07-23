# frozen_string_literal: true

require "sod"

module Pennyworth
  module CLI
    module Actions
      # Handles the Standard Gems action.
      class StandardGems < Sod::Action
        include Import[:kernel]

        description "Render Alfred Standard Gems script filter."

        on "--standard_gems", argument: "[KIND]", allow: %w[all default bundled], default: "all"

        def initialize(processor: Processor.for_standard_gems, **)
          super(**)
          @processor = processor
        end

        def call kind = nil
          endpoint = "#{kind || default}_gems.json"
          kernel.puts processor.call(endpoint).to_json
        end

        private

        attr_reader :processor
      end
    end
  end
end
