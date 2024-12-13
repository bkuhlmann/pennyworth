# frozen_string_literal: true

require "sod"

module Pennyworth
  module CLI
    module Actions
      module GitHub
        # Handles the GitHub user action.
        class User < Sod::Action
          include Dependencies[:io, processor: "processors.project"]

          description "Specify user."

          on %w[-u --user], argument: "[HANDLE]"

          default { Container[:settings].git_hub_user }

          def call(handle = default) = io.puts processor.call("users/#{handle}").to_json
        end
      end
    end
  end
end
