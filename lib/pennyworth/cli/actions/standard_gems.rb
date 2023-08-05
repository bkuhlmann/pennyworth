# frozen_string_literal: true

require "sod"

module Pennyworth
  module CLI
    module Actions
      # Handles the Standard Gems action.
      class StandardGems < Sod::Action
        include Import[:kernel]

        ENDPOINTS = {
          "all" => "stdgems.json",
          "default" => "default_gems.json",
          "bundled" => "bundled_gems.json"
        }.freeze

        description "Render Alfred Standard Gems script filter."

        on "--standard_gems", argument: "[KIND]", allow: %w[all default bundled], default: "all"

        def initialize(processor: Processor.for_standard_gems, endpoints: ENDPOINTS, **)
          super(**)
          @processor = processor
          @endpoints = endpoints
        end

        def call(kind = nil) = kernel.puts processor.call(endpoints.fetch(kind || default)).to_json

        private

        attr_reader :processor, :endpoints
      end
    end
  end
end
