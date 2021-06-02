# frozen_string_literal: true

module Pennyworth
  module Serializers
    # Serializes a HTTP status into a compatible format for parsing within Alfred script filters.
    class HTTPStatus
      def initialize presenter
        @presenter = presenter
      end

      def to_h
        {
          uid: id,
          title: code,
          subtitle: label,
          arg: presenter.symbol,
          mods: modifications,
          text: {copy: "#{code} #{label}", largetype: "#{code} #{label}"}
        }
      end

      private

      attr_reader :presenter

      def id = presenter.id

      def code = presenter.code

      def label = presenter.label

      def modifications
        {
          control: {subtitle: "Copy code.", arg: id},
          alt: {subtitle: "Copy label.", arg: label},
          cmd: {subtitle: "View documentation.", arg: presenter.url}
        }
      end
    end
  end
end
