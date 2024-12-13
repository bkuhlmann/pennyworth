# frozen_string_literal: true

require "sod"

module Pennyworth
  module CLI
    module Actions
      module HTMX
        # Handles references documentation action.
        class Reference < Sod::Action
          include Dependencies[:settings, :io, processor: "processors.htmx"]

          description "Render Alfred references script filter."

          on "--references"

          def call(*) = io.puts processor.call(settings.htmx_references_uri).to_json
        end
      end
    end
  end
end
