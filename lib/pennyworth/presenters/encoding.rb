# frozen_string_literal: true

module Pennyworth
  module Presenters
    # Renders encoding into a compatible format for use in Alfred script filters.
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
