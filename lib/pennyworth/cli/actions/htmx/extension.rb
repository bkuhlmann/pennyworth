# frozen_string_literal: true

require "sod"

module Pennyworth
  module CLI
    module Actions
      module HTMX
        # Handles extension documentation action.
        class Extension < Sod::Action
          include Dependencies[:settings, :io, processor: "processors.htmx"]

          description "Render Alfred extensions script filter."

          on "--extensions"

          def call(*) = io.puts processor.call(settings.htmx_extensions_uri).to_json
        end
      end
    end
  end
end
