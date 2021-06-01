# frozen_string_literal: true

module Pennyworth
  module Serializers
    # Serializes a encoding into a compatible format for parsing within Alfred script filters.
    class Encoding
      def initialize presenter
        @presenter = presenter
      end

      def to_h
        {
          uid: presenter.id,
          title: label,
          subtitle: %(Aliases: #{aliases}.),
          arg: label,
          mods: {
            alt: {subtitle: "Copy aliases.", arg: aliases}
          },
          text: {copy: label, largetype: label}
        }
      end

      private

      attr_reader :presenter

      def label = presenter.label

      def aliases = presenter.aliases.join(", ")
    end
  end
end
