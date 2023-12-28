# frozen_string_literal: true

require "refinements/string"

module Pennyworth
  module Loaders
    # Loads an array of text records.
    class Text
      using Refinements::String

      TRANSFORMS = %w[camelcase capitalize downcase size snakecase titleize upcase].freeze

      def initialize transforms: TRANSFORMS, model: Models::Text
        @transforms = transforms
        @model = model
      end

      def call content
        transforms.map { |kind| model[id: kind, content: content.public_send(kind)] }
      end

      private

      attr_reader :transforms, :model
    end
  end
end
