# frozen_string_literal: true

require "sod"

module Pennyworth
  module CLI
    module Actions
      # Handles Rodauth feature action.
      class Rodauth < Sod::Action
        include Dependencies[:settings, :io, processor: "processors.rodauth"]

        description "Render Alfred Rodauth script filter."

        on "--rodauth"

        def call(*) = io.puts processor.call(settings.rodauth_documentation_uri).to_json
      end
    end
  end
end
