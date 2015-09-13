module Pennyworth
  module Identity
    def self.name
      "pennyworth"
    end

    def self.label
      "Pennyworth"
    end

    def self.version
      "3.1.0"
    end

    def self.label_version
      [label, version].join " "
    end

    def self.file_name
      ".#{name}rc"
    end
  end
end
