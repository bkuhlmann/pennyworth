# frozen_string_literal: true

require "sod"

module Pennyworth
  module CLI
    module Actions
      module HTMX
        # Handles extension documentation action.
        class Extension < Sod::Action
          include Dependencies[:settings, :io]

          description "Render Alfred extensions script filter."

          on "--extensions"

          def initialize(processor: Processor.for_htmx, **)
            @processor = processor
            super(**)
          end

          def call(*) = io.puts processor.call(settings.htmx_extensions_uri).to_json

          private

          attr_reader :processor
        end
      end
    end
  end
end
