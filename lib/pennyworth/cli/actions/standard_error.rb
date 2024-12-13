# frozen_string_literal: true

require "sod"

module Pennyworth
  module CLI
    module Actions
      # Handles the system error action.
      class StandardError < Sod::Action
        include Dependencies[:io, processor: "processors.standard_error"]

        description "Render Alfred standard errors script filter."

        on "--standard_errors"

        def call(*) = io.puts processor.call.to_json
      end
    end
  end
end
