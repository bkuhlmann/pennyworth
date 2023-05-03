# frozen_string_literal: true

module Pennyworth
  # Overrides any string to desired form if matched, otherwise answers the original string.
  class Inflector
    DEFAULTS = Array(Container[:configuration].inflections).reduce({}, :merge)

    def initialize overrides = DEFAULTS
      @overrides = overrides
    end

    def call(key) = overrides.fetch(key) { |fallback| fallback }

    private

    attr_reader :overrides
  end
end
