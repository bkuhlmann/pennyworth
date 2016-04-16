# frozen_string_literal: true

module Pennyworth
  module Kits
    # Provides String utilities.
    class String
      def self.array_to_string array, delimiter = " "
        array * delimiter
      end

      def self.downcase array
        string = Pennyworth::Kits::String.array_to_string array
        puts Pennyworth::Kits::Clipboard.copy(string.downcase)
      end

      def self.upcase array
        string = Pennyworth::Kits::String.array_to_string array
        puts Pennyworth::Kits::Clipboard.copy(string.upcase)
      end

      def self.capitalize array
        words = array.map(&:capitalize)
        words = Pennyworth::Kits::String.array_to_string words
        puts Pennyworth::Kits::Clipboard.copy(words)
      end

      def self.length array
        string = Pennyworth::Kits::String.array_to_string array
        Pennyworth::Kits::Clipboard.copy(string)
        puts string.length
      end
    end
  end
end
