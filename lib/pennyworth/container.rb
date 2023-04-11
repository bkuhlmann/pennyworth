# frozen_string_literal: true

require "cogger"
require "dry/container"
require "http"
require "spek"

module Pennyworth
  # Provides a global gem container for injection into other objects.
  module Container
    extend Dry::Container::Mixin

    register(:configuration) { Configuration::Loader.call }
    register(:specification) { Spek::Loader.call "#{__dir__}/../../pennyworth.gemspec" }
    register(:environment) { ENV }
    register(:kernel) { Kernel }
    register(:http) { HTTP }
    register(:logger) { Cogger.new formatter: :emoji }
  end
end
