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

    register :registry do
      Etcher::Registry.new(contract: Configuration::Contract, model: Configuration::Model)
                      .add_loader(:yaml, self[:defaults_path])
                      .add_loader(:yaml, self[:xdg_config].active)
                      .add_transformer(:format, :htmx_examples_uri)
                      .add_transformer(:format, :htmx_extensions_uri)
                      .add_transformer(:format, :htmx_references_uri)
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
