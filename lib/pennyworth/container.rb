# frozen_string_literal: true

require "cogger"
require "dry/container"
require "etcher"
require "http"
require "runcom"
require "spek"

module Pennyworth
  # Provides a global gem container for injection into other objects.
  module Container
    extend Dry::Container::Mixin

    register :configuration do
      self[:defaults].add_loader(Etcher::Loaders::YAML.new(self[:xdg_config].active))
                     .then { |registry| Etcher.call registry }
    end

    register :defaults do
      Etcher::Registry.new(contract: Configuration::Contract, model: Configuration::Model)
                      .add_loader(Etcher::Loaders::YAML.new(self[:defaults_path]))
    end

    register(:defaults_path) { Pathname(__dir__).join("configuration/defaults.yml") }
    register(:xdg_config) { Runcom::Config.new "pennyworth/configuration.yml" }
    register(:specification) { Spek::Loader.call "#{__dir__}/../../pennyworth.gemspec" }
    register(:kernel) { Kernel }
    register(:http) { HTTP }
    register(:logger) { Cogger.new formatter: :emoji }
  end
end
