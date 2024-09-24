# frozen_string_literal: true

module Pennyworth
  module Presenters
    # Shapes an encoding record for serialization.
    class Encoding
      def initialize record
        @record = record
      end

      def id = record.name

      def label = record.name

      def aliases = record.aliases

      private

      attr_reader :record
    end
  end
end
