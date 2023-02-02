# frozen_string_literal: true

require "core"

module Pennyworth
  module CLI
    # The main Command Line Interface (CLI) object.
    class Shell
      include Actions::Import[
        :config,
        :encodings,
        :git_hub,
        :http_statuses,
        :ruby_gems,
        :standard_errors,
        :system_errors,
        :system_signals,
        :text,
        :specification,
        :logger
      ]

      def initialize(parser: Parser.new, **)
        super(**)
        @parser = parser
      end

      def call arguments = Core::EMPTY_ARRAY
        act_on parser.call(arguments)
      rescue OptionParser::ParseError, KeyError => error
        logger.error { error.message }
      end

      private

      attr_reader :parser

      def act_on configuration
        case configuration
          in action_config: Symbol => action then config.call action
          in action_encodings: true then encodings.call
          in action_git_hub: :organization
            git_hub.call "orgs/#{configuration.git_hub_organization}"
          in action_git_hub: :user then git_hub.call "users/#{configuration.git_hub_user}"
          in action_http_statuses: true then http_statuses.call
          in action_ruby_gems: true
            ruby_gems.call "owners/#{configuration.ruby_gems_owner}/gems.json"
          in action_standard_errors: true then standard_errors.call
          in action_system_errors: true then system_errors.call
          in action_system_signals: true then system_signals.call
          in action_text: String => content then text.call content
          in action_version: true then logger.info { specification.labeled_version }
          else logger.any { parser.to_s }
        end
      end
    end
  end
end
