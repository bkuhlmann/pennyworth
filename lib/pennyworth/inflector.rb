# frozen_string_literal: true

module Pennyworth
  # Overrides any string to desired form if matched, otherwise answers the original string.
  class Inflector
    DEFAULTS = Array(CLI::Configuration::Loader.call.inflections).reduce({}, :merge)

    def initialize overrides = DEFAULTS
      @overrides = overrides
    end

    def call(key) = overrides.fetch(key) { |missing_key| missing_key }

    private

    attr_reader :overrides
  end
end
