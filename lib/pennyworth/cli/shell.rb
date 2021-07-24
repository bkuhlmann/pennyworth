# frozen_string_literal: true

module Pennyworth
  module CLI
    # The main Command Line Interface (CLI) object.
    class Shell
      ACTIONS = {
        config: Actions::Config.new,
        encodings: Actions::Encodings.new,
        git_hub: Actions::GitHub.new,
        http_statuses: Actions::HTTPStatuses.new,
        ruby_gems: Actions::RubyGems.new,
        system_errors: Actions::System::Errors.new,
        system_signals: Actions::System::Signals.new,
        text: Actions::Text.new
      }.freeze

      def initialize parser: Parsers::Assembler.new, actions: ACTIONS, container: Container
        @parser = parser
        @actions = actions
        @container = container
      end

      def call arguments = []
        perform parser.call(arguments)
      rescue OptionParser::ParseError, KeyError => error
        logger.error error.message
      end

      private

      attr_reader :parser, :actions, :container

      # rubocop:disable Metrics/MethodLength
      def perform configuration
        case configuration
          in action_config: Symbol => action then config action
          in action_encodings: true then encodings
          in action_git_hub: :organization then git_hub_organization configuration
          in action_git_hub: :user then git_hub_user configuration
          in action_http_statuses: true then http_statuses
          in action_ruby_gems: true then ruby_gems configuration
          in action_system_signals: true then system_signals
          in action_system_errors: true then system_errors
          in action_text: String => content then text content
          in action_version: String => version then logger.info version
          else usage
        end
      end
      # rubocop:enable Metrics/MethodLength

      def config(action) = actions.fetch(__method__).call(action)

      def encodings = actions.fetch(__method__).call

      def git_hub_organization configuration
        actions.fetch(:git_hub).call("orgs/#{configuration.git_hub_organization}/repos")
      end

      def git_hub_user configuration
        actions.fetch(:git_hub).call("users/#{configuration.git_hub_user}/repos")
      end

      def http_statuses = actions.fetch(__method__).call

      def ruby_gems configuration
        actions.fetch(__method__).call("owners/#{configuration.ruby_gems_owner}/gems.json")
      end

      def system_errors = actions.fetch(__method__).call

      def system_signals = actions.fetch(__method__).call

      def text(content) = actions.fetch(__method__).call(content)

      def usage = logger.unknown { parser.to_s }

      def logger = container[__method__]
    end
  end
end
