module Pennyworth
  module Kits
    # Provides String utilities.
    class String
      # Builds a string from an array.
      # ==== Parameters
      # * +array+ - Required. The array to build a string from.
      # * +delimiter+ - Optional. The delimiter used to join each array element. Default: ' '
      def self.array_to_string array, delimiter = " "
        array * delimiter
      end

      # Converts and outputs a string array as a downcased string.
      # ==== Parameters
      # * +array+ - Required. The string array to process.
      def self.downcase array
        string = Pennyworth::Kits::String.array_to_string array
        puts Pennyworth::Kits::Clipboard.copy(string.downcase)
      end

      # Converts and outputs a string array as an upcased string.
      # ==== Parameters
      # * +array+ - Required. The string array to process.
      def self.upcase array
        string = Pennyworth::Kits::String.array_to_string array
        puts Pennyworth::Kits::Clipboard.copy(string.upcase)
      end

      # Converts and outputs a string array as a capitalized string.
      # ==== Parameters
      # * +array+ - Required. The string array to process.
      def self.capitalize array
        words = array.map(&:capitalize)
        words = Pennyworth::Kits::String.array_to_string words
        puts Pennyworth::Kits::Clipboard.copy(words)
      end

      # Converts a string array to a single string and outputs the string length.
      # ==== Parameters
      # * +array+ - Required. The string array to process.
      def self.length array
        string = Pennyworth::Kits::String.array_to_string array
        Pennyworth::Kits::Clipboard.copy(string)
        puts string.length
      end
    end
  end
end
