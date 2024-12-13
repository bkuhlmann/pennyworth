# frozen_string_literal: true

require "sod"

module Pennyworth
  module CLI
    module Actions
      module HTMX
        # Handles examples documentation action.
        class Example < Sod::Action
          include Dependencies[:settings, :io, processor: "processors.htmx"]

          description "Render Alfred examples script filter."

          on "--examples"

          def call(*) = io.puts processor.call(settings.htmx_examples_uri).to_json
        end
      end
    end
  end
end
