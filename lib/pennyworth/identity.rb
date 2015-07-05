module Pennyworth
  module Identity
    def self.name
      "pennyworth"
    end

    def self.label
      "Pennyworth"
    end

    def self.version
      "3.0.0"
    end

    def self.label_version
      [label, version].join " "
    end
  end
end
