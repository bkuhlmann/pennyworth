# frozen_string_literal: true

module Pennyworth
  # Gem identity information.
  module Identity
    def self.name
      "pennyworth"
    end

    def self.label
      "Pennyworth"
    end

    def self.version
      "8.3.2"
    end

    def self.version_label
      "#{label} #{version}"
    end
  end
end
