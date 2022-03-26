# frozen_string_literal: true

require "refinements/structs"

module Pennyworth
  module CLI
    module Parsers
      # Handles parsing of Command Line Interface (CLI) GitHub options.
      class GitHub
        using Refinements::Structs

        def self.call(...) = new(...).call

        def initialize configuration = Container[:configuration], client: Parser::CLIENT
          @configuration = configuration
          @client = client
        end

        def call arguments = []
          client.separator "\nGITHUB OPTIONS:\n"
          private_methods.sort.grep(/add_/).each { |method| __send__ method }
          client.parse arguments
          configuration
        end

        private

        attr_reader :configuration, :client

        def add_organization
          client.on(
            "--organization [HANDLE]",
            %(Set organization. Default: "#{organization}".)
          ) do |handle|
            configuration.merge! action_git_hub: :organization,
                                 git_hub_organization: handle || organization
          end
        end

        def add_user
          client.on "--user [HANDLE]", %(Set user. Default: "#{user}".) do |handle|
            configuration.merge! action_git_hub: :user, git_hub_user: handle || user
          end
        end

        def organization = configuration.git_hub_organization

        def user = configuration.git_hub_user
      end
    end
  end
end
