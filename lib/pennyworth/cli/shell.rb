# frozen_string_literal: true

require "sod"

module Pennyworth
  module CLI
    # The main Command Line Interface (CLI) object.
    class Shell
      include Import[:defaults_path, :xdg_config, :specification]

      def initialize(context: Sod::Context, dsl: Sod, **)
        super(**)
        @context = context
        @dsl = dsl
      end

      def call(...) = cli.call(...)

      private

      attr_reader :context, :dsl

      def cli
        context = build_context

        dsl.new :pennyworth, banner: specification.banner do
          on(Sod::Prefabs::Commands::Config, context:)

          on "git_hub", "Render Alfred GitHub repositories script filter." do
            on Actions::GitHub::Organization
            on Actions::GitHub::User
          end

          on Actions::Encoding
          on Actions::HTTPStatus
          on Actions::Gem
          on Actions::StandardGem
          on Actions::StandardError
          on Actions::System::Error
          on Actions::System::Signal
          on Actions::Text
          on(Sod::Prefabs::Actions::Version, context:)
          on Sod::Prefabs::Actions::Help, self
        end
      end

      def build_context
        context[defaults_path:, xdg_config:, version_label: specification.labeled_version]
      end
    end
  end
end
