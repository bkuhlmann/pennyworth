# frozen_string_literal: true

require "sod"

module Pennyworth
  module CLI
    module Actions
      # Handles the encoding action.
      class Encoding < Sod::Action
        include Dependencies[:io, processor: "processors.encoding"]

        description "Render Alfred encodings script filter."

        on "--encodings"

        def call(*) = io.puts processor.call.to_json
      end
    end
  end
end
