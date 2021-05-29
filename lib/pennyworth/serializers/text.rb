# frozen_string_literal: true

module Pennyworth
  module Serializers
    # Serializes a text into a compatible format for parsing within Alfred script filters.
    class Text
      def initialize presenter
        @presenter = presenter
      end

      def to_h
        {
          uid: id,
          title: presenter.label,
          subtitle: id.capitalize,
          arg: content,
          icon: {path: "text/#{id}.png"},
          text: {copy: content, largetype: content}
        }
      end

      private

      attr_reader :presenter

      def id = presenter.id

      def content = presenter.content
    end
  end
end
