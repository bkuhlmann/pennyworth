# frozen_string_literal: true

require "refinements/array"

module Pennyworth
  module Loaders
    # Loads an array of encoding records.
    class Encoding
      using Refinements::Array

      def initialize encoding: ::Encoding, model: Models::Encoding
        @encoding = encoding
        @model = model
      end

      def call(*)
        encoding.aliases
                .map { |_second, first| first }
                .uniq
                .sort
                .map do |first|
                  model[name: first, aliases: encoding.find(first).names.sort.excluding(first)]
                end
      end

      private

      attr_reader :encoding, :model
    end
  end
end
