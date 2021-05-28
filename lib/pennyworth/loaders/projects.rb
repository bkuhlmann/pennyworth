# frozen_string_literal: true

module Pennyworth
  module Loaders
    # Loads projects from API requests for further processing.
    class Projects
      def self.for_git_hub = new(client: Integrations::GitHub::Client.new)

      def self.for_ruby_gems = new(client: Integrations::RubyGems::Client.new)

      def initialize client:
        @client = client
      end

      def call(endpoint) = client.get(endpoint)

      private

      attr_reader :client
    end
  end
end
