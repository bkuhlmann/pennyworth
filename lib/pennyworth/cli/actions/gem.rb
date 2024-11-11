# frozen_string_literal: true

require "sod"

module Pennyworth
  module CLI
    module Actions
      # Handles the RubyGem action.
      class Gem < Sod::Action
        include Dependencies[:io]

        description "Render Alfred RubyGems script filter."

        on "--gems", argument: "[HANDLE]"

        default { Container[:settings].ruby_gems_owner }

        def initialize(processor: Processor.for_gems, **)
          super(**)
          @processor = processor
        end

        def call(handle = default) = io.puts processor.call("owners/#{handle}/gems.json").to_json

        private

        attr_reader :processor
      end
    end
  end
end
