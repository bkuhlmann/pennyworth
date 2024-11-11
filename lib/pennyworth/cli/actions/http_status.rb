# frozen_string_literal: true

require "sod"

module Pennyworth
  module CLI
    module Actions
      # Handles the HTTP status action.
      class HTTPStatus < Sod::Action
        include Dependencies[:io]

        description "Render Alfred HTTP statuses script filter."

        on "--http_statuses"

        def initialize(processor: Processor.for_http_statuses, **)
          super(**)
          @processor = processor
        end

        def call(*) = io.puts processor.call.to_json

        private

        attr_reader :processor
      end
    end
  end
end
