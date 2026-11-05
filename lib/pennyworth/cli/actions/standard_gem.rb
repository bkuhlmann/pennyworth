# frozen_string_literal: true

require "sod"

module Pennyworth
  module CLI
    module Actions
      # Handles the Standard Gem action.
      class StandardGem < Sod::Action
        ENDPOINTS = {
          "all" => "stdgems.json",
          "default" => "default_gems.json",
          "bundled" => "bundled_gems.json"
        }.freeze

        include Dependencies[:io, processor: "processors.standard_gem"]

        description "Render Alfred Standard Gems script filter."

        on "--standard_gems", argument: "[KIND]", allow: %w[all default bundled], default: "all"

        def initialize(endpoints: ENDPOINTS, **)
          super(**)
          @endpoints = endpoints
        end

        def call(kind = default) = io.puts processor.call(endpoints.fetch(kind)).to_json

        private

        attr_reader :endpoints
      end
    end
  end
end
