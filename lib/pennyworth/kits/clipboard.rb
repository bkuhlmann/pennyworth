# frozen_string_literal: true

module Pennyworth
  module Kits
    # Provides OSX clipboard utility methods.
    class Clipboard
      def self.copy text
        IO.popen("pbcopy", "w").print text
        text
      end
    end
  end
end
