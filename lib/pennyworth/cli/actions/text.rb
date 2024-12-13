# frozen_string_literal: true

require "sod"

module Pennyworth
  module CLI
    module Actions
      # Handles the text action.
      class Text < Sod::Action
        include Dependencies[:io, processor: "processors.text"]

        description "Render Alfred text script filter."

        on "--text", argument: "CONTENT"

        def call(content) = io.puts processor.call(content).to_json
      end
    end
  end
end
