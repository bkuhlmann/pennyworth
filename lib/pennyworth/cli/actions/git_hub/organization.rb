# frozen_string_literal: true

require "sod"

module Pennyworth
  module CLI
    module Actions
      module GitHub
        # Handles the GitHub user action.
        class Organization < Sod::Action
          include Import[:kernel]

          description "Specify organization."

          on %w[-o --organization],
             argument: "[HANDLE]",
             default: Container[:configuration].git_hub_organization

          def initialize(processor: Processor.for_projects, **)
            super(**)
            @processor = processor
          end

          def call(handle = default) = kernel.puts processor.call("orgs/#{handle}").to_json

          private

          attr_reader :processor
        end
      end
    end
  end
end
