# frozen_string_literal: true

require "sod"

module Pennyworth
  module CLI
    module Actions
      module GitHub
        # Handles the GitHub user action.
        class User < Sod::Action
          include Dependencies[:io]

          description "Specify user."

          on %w[-u --user], argument: "[HANDLE]"

          default { Container[:settings].git_hub_user }

          def initialize(processor: Processor.for_projects, **)
            super(**)
            @processor = processor
          end

          def call(handle = default) = io.puts processor.call("users/#{handle}").to_json

          private

          attr_reader :processor
        end
      end
    end
  end
end
