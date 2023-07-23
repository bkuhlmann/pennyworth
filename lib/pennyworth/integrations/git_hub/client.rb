# frozen_string_literal: true

require "core"
require "ghub"

module Pennyworth
  module Integrations
    module GitHub
      # Provides low-level access to the GitHub API.
      class Client
        def initialize endpoint: Ghub::Endpoints::Repositories::Root.new
          @endpoint = endpoint
        end

        def get(path) = endpoint.index(*path.split("/")).value_or(Core::EMPTY_ARRAY).map(&:to_h)

        private

        attr_reader :endpoint
      end
    end
  end
end
