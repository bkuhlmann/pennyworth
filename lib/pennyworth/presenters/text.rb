# frozen_string_literal: true

require "forwardable"

module Pennyworth
  module Presenters
    # Renders text into a compatible format for use in Alfred script filters.
    class Text
      extend Forwardable

      delegate %i[id content] => :record

      def initialize record, inflector: Inflector.new
        @record = record
        @inflector = inflector
      end

      def label = inflector.call(record.content.to_s)

      private

      attr_reader :record, :inflector
    end
  end
end
