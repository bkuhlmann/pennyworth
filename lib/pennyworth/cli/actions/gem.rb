# frozen_string_literal: true

require "sod"

module Pennyworth
  module CLI
    module Actions
      # Handles the RubyGem action.
      class Gem < Sod::Action
        include Dependencies[:io, processor: "processors.gem"]

        description "Render Alfred RubyGems script filter."

        on "--gems", argument: "[HANDLE]"

        default { Container[:settings].ruby_gems_owner }

        def call(handle = default) = io.puts processor.call("owners/#{handle}/gems.json").to_json
      end
    end
  end
end
