# frozen_string_literal: true

require "sod"

module Pennyworth
  module CLI
    module Actions
      module GitHub
        # Handles the GitHub user action.
        class Organization < Sod::Action
          include Import[:io]

          description "Specify organization."

          on %w[-o --organization], argument: "[HANDLE]"

          default { Container[:settings].git_hub_organization }

          def initialize(processor: Processor.for_projects, **)
            super(**)
            @processor = processor
          end

          def call(handle = nil) = io.puts processor.call("orgs/#{handle || default}").to_json

          private

          attr_reader :processor
        end
      end
    end
  end
end
