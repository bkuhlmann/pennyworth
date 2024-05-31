# frozen_string_literal: true

require "cogger"
require "containable"
require "etcher"
require "http"
require "runcom"
require "spek"

module Pennyworth
  # Provides a global gem container for injection into other objects.
  module Container
    extend Containable

    register :configuration do
      self[:defaults].add_loader(:yaml, self[:xdg_config].active)
                     .then { |registry| Etcher.call registry }
    end

    register :defaults do
      Etcher::Registry.new(contract: Configuration::Contract, model: Configuration::Model)
                      .add_loader(:yaml, self[:defaults_path])
    end

    register(:specification) { Spek::Loader.call "#{__dir__}/../../pennyworth.gemspec" }
    register(:defaults_path) { Pathname(__dir__).join("configuration/defaults.yml") }
    register(:xdg_config) { Runcom::Config.new "pennyworth/configuration.yml" }
    register(:logger) { Cogger.new id: :pennyworth }
    register :http, HTTP
    register :kernel, Kernel
  end
end
