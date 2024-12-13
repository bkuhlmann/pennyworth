# frozen_string_literal: true

require "sod"

module Pennyworth
  module CLI
    module Actions
      module GitHub
        # Handles the GitHub user action.
        class Organization < Sod::Action
          include Dependencies[:io, processor: "processors.project"]

          description "Specify organization."

          on %w[-o --organization], argument: "[HANDLE]"

          default { Container[:settings].git_hub_organization }

          def call(handle = default) = io.puts processor.call("orgs/#{handle}").to_json
        end
      end
    end
  end
end
