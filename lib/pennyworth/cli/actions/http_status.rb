# frozen_string_literal: true

require "sod"

module Pennyworth
  module CLI
    module Actions
      # Handles the HTTP status action.
      class HTTPStatus < Sod::Action
        include Dependencies[:io, processor: "processors.http_status"]

        description "Render Alfred HTTP statuses script filter."

        on "--http_statuses"

        def call(*) = io.puts processor.call.to_json
      end
    end
  end
end
