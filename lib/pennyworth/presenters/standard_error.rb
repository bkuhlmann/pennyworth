# frozen_string_literal: true

require "refinements/array"

module Pennyworth
  module Presenters
    # Shapes a standard error record for serialization.
    class StandardError
      using Refinements::Array

      def initialize record
        @record = record
      end

      def id = label

      def label = record.name.to_s

      def path = file_path.empty? ? "" : [file_path, record.line_number].compress.join(":")

      private

      attr_reader :record

      def file_path = record.file_path.to_s
    end
  end
end
