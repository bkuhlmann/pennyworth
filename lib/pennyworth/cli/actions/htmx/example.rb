# frozen_string_literal: true

require "sod"

module Pennyworth
  module CLI
    module Actions
      module HTMX
        # Handles examples documentation action.
        class Example < Sod::Action
          include Import[:settings, :io]

          description "Render Alfred examples script filter."

          on "--examples"

          def initialize(processor: Processor.for_htmx, **)
            @processor = processor
            super(**)
          end

          def call(*) = io.puts processor.call(settings.htmx_examples_uri).to_json

          private

          attr_reader :processor
        end
      end
    end
  end
end
