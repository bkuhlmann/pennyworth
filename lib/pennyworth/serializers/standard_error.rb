# frozen_string_literal: true

module Pennyworth
  module Serializers
    # Serializes a standard error presenter for parsing by Alfred script filters.
    class StandardError
      def initialize presenter
        @presenter = presenter
      end

      def to_h
        {
          uid: id,
          title: id,
          arg: label,
          mods: modifications,
          text: {copy: label, largetype: label}
        }
      end

      private

      attr_reader :presenter

      def id = presenter.id

      def label = presenter.label

      def description = presenter.description

      def modifications
        {
          control: {subtitle: "Copy label.", arg: label},
          alt: {subtitle: "Copy path.", arg: path}
        }
      end

      def path = presenter.path
    end
  end
end
