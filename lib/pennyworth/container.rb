# frozen_string_literal: true

require "cogger"
require "containable"
require "etcher"
require "http"
require "ox"
require "runcom"
require "spek"

module Pennyworth
  # Provides a global gem container for injection into other objects.
  module Container
    extend Containable

    register :registry, as: :fresh do
      Etcher::Registry.new(contract: Configuration::Contract, model: Configuration::Model)
                      .add_loader(:yaml, self[:defaults_path])
                      .add_loader(:yaml, self[:xdg_config].active)
                      .add_transformer(:format, :htmx_examples_uri)
                      .add_transformer(:format, :htmx_extensions_uri)
                      .add_transformer(:format, :htmx_references_uri)
                      .add_transformer(:format, :rodauth_documentation_uri)
    end

    namespace :processors do
      register :encoding do
        Processor.new loader: Loaders::Encoding.new,
                      presenter: Presenters::Encoding,
                      serializer: Serializers::Encoding
      end

      register :gem do
        Processor.new loader: Loaders::Gem.new,
                      presenter: Presenters::Gem,
                      serializer: Serializers::Project
      end

      register :htmx do
        Processor.new loader: Loaders::HTMX.new,
                      presenter: Presenters::HTMX,
                      serializer: Serializers::HTMX
      end

      register :http_status do
        Processor.new loader: Loaders::HTTPStatus.new,
                      presenter: Presenters::HTTPStatus,
                      serializer: Serializers::HTTPStatus
      end

      register :project do
        Processor.new loader: Loaders::GitHub.new,
                      presenter: Presenters::Repository,
                      serializer: Serializers::Project
      end

      register :rodauth do
        Processor.new loader: Loaders::Rodauth.new,
                      presenter: Presenters::Rodauth,
                      serializer: Serializers::Rodauth
      end

      register :standard_gem do
        Processor.new loader: Loaders::StandardGem.new,
                      presenter: Presenters::StandardGem,
                      serializer: Serializers::Project
      end

      register :standard_error do
        Processor.new loader: Loaders::StandardError.new,
                      presenter: Presenters::StandardError,
                      serializer: Serializers::StandardError
      end

      register :system_error do
        Processor.new loader: Loaders::System::Error.new,
                      presenter: Presenters::System::Error,
                      serializer: Serializers::System::Error
      end

      register :system_signal do
        Processor.new loader: Loaders::System::Signal.new,
                      presenter: Presenters::System::Signal,
                      serializer: Serializers::System::Signal
      end

      register :text do
        Processor.new loader: Loaders::Text.new,
                      presenter: Presenters::Text,
                      serializer: Serializers::Text
      end
    end

    register :ox do
      Ox.tap { |ox| ox.default_options = {mode: :generic, effort: :tolerant, smart: true} }
    end

    register(:settings) { Etcher.call(self[:registry]).dup }
    register(:specification) { Spek::Loader.call "#{__dir__}/../../pennyworth.gemspec" }
    register(:defaults_path) { Pathname(__dir__).join("configuration/defaults.yml") }
    register(:xdg_config) { Runcom::Config.new "pennyworth/configuration.yml" }
    register(:http) { HTTP.timeout 3 }
    register(:logger) { Cogger.new id: :pennyworth }
    register :io, STDOUT
  end
end
