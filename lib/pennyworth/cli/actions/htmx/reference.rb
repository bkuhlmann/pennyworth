# frozen_string_literal: true

require "sod"

module Pennyworth
  module CLI
    module Actions
      module HTMX
        # Handles references documentation action.
        class Reference < Sod::Action
          include Import[:settings, :io]

          description "Render Alfred references script filter."

          on "--references"

          def initialize(processor: Processor.for_htmx, **)
            @processor = processor
            super(**)
          end

          def call(*) = io.puts processor.call(settings.htmx_references_uri).to_json

          private

          attr_reader :processor
        end
      end
    end
  end
end
