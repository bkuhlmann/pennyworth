# frozen_string_literal: true

require "sod"

module Pennyworth
  module CLI
    module Actions
      module HTMX
        # Handles pattern documentation action.
        class Pattern < Sod::Action
          include Dependencies[:settings, :io, processor: "processors.htmx"]

          description "Render Alfred patterns script filter."

          on "--patterns"

          def call(*) = io.puts processor.call(settings.htmx_patterns_uri).to_json
        end
      end
    end
  end
end
