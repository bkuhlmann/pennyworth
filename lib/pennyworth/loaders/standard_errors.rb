# frozen_string_literal: true

module Pennyworth
  module Loaders
    # Loads an array of standard error records.
    class StandardErrors
      def initialize root: StandardError, model: Models::StandardError
        @root = root
        @model = model
      end

      def call _omit = nil
        ObjectSpace.each_object(Class)
                   .select { |klass| klass < root }
                   .sort_by(&:name)
                   .map do |error|
                     file_path, line_number = Object.const_source_location error.name
                     model[name: error, file_path:, line_number:]
                   end
      end

      private

      attr_reader :root, :model
    end
  end
end
