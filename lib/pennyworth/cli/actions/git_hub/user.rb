# frozen_string_literal: true

require "sod"

module Pennyworth
  module CLI
    module Actions
      module GitHub
        # Handles the GitHub user action.
        class User < Sod::Action
          include Import[:kernel]

          description "Specify user."

          on %w[-u --user], argument: "[HANDLE]"

          default { Container[:settings].git_hub_user }

          def initialize(processor: Processor.for_projects, **)
            super(**)
            @processor = processor
          end

          def call(handle = nil) = kernel.puts processor.call("users/#{handle || default}").to_json

          private

          attr_reader :processor
        end
      end
    end
  end
end
