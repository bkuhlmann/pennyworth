# frozen_string_literal: true

require "sod"

module Pennyworth
  module CLI
    module Actions
      # Handles the RubyGem action.
      class Gem < Sod::Action
        include Import[:io]

        description "Render Alfred RubyGems script filter."

        on "--gems", argument: "[HANDLE]"

        default { Container[:settings].ruby_gems_owner }

        def initialize(processor: Processor.for_gems, **)
          super(**)
          @processor = processor
        end

        def call handle = nil
          endpoint = "owners/#{handle || default}/gems.json"
          io.puts processor.call(endpoint).to_json
        end

        private

        attr_reader :processor
      end
    end
  end
end
