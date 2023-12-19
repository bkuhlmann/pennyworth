# frozen_string_literal: true

require "core"
require "ghub"

module Pennyworth
  module Loaders
    # Loads an array projects from the GitHub API.
    class GitHub
      def initialize endpoint: Ghub::Endpoints::Repositories::Root.new
        @endpoint = endpoint
      end

      def call(path) = endpoint.index(*path.split("/")).value_or(Core::EMPTY_ARRAY).map(&:to_h)

      private

      attr_reader :endpoint
    end
  end
end
