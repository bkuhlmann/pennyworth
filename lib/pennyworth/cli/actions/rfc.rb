# frozen_string_literal: true

require "sod"

module Pennyworth
  module CLI
    module Actions
      # Handles RFC feature action.
      class RFC < Sod::Action
        include Dependencies[:settings, :io, processor: "processors.rfc"]

        description "Render Alfred RFC script filter."

        on "--rfc"

        def call(*) = io.puts processor.call(settings.rfc_index_uri).to_json
      end
    end
  end
end
