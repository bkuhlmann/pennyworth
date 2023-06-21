# frozen_string_literal: true

require "sod"

module Pennyworth
  module CLI
    module Actions
      # Handles the RubyGems action.
      class RubyGems < Sod::Action
        include Import[:kernel]

        description "Render Alfred RubyGems script filter."

        on "--ruby_gems", argument: "[HANDLE]"

        default { Container[:configuration].ruby_gems_owner }

        def initialize(processor: Processor.for_gems, **)
          super(**)
          @processor = processor
        end

        def call handle = nil
          endpoint = "owners/#{handle || default}/gems.json"
          kernel.puts processor.call(endpoint).to_json
        end

        private

        attr_reader :processor
      end
    end
  end
end
