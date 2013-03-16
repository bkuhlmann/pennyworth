module Pennyworth
  module Kits
    # Provides OSX clipboard utility methods.
    class Clipboard

      # Copies text to the OSX clipboard.
      # ==== Parameters
      # * +text+ - Required. The text to send to the clipboard.
      def self.copy text
        IO.popen("pbcopy", 'w').print text
        text
      end
    end
  end
end
