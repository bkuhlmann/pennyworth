# frozen_string_literal: true

module Pennyworth
  module Serializers
    # Serializes a encoding into a compatible format for parsing within Alfred script filters.
    class Encoding
      using Refinements::Array

      def initialize presenter
        @presenter = presenter
      end

      def to_h
        {
          uid: presenter.id,
          title: label,
          subtitle: %(Aliases: #{aliases.to_sentence}.),
          arg: label,
          mods: {
            alt: {subtitle: "Copy aliases.", arg: aliases.join(", ")}
          },
          text: {copy: label, largetype: label}
        }
      end

      private

      attr_reader :presenter

      def label = presenter.label

      def aliases = presenter.aliases
    end
  end
end
