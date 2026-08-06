# frozen_string_literal: true

require "forwardable"

module Pennyworth
  module Presenters
    # Shapes a RFC record for serialization.
    class RFC
      extend Forwardable

      delegate Models::RFC.members => :record

      def initialize record
        @record = record
      end

      alias id number

      def subtitle = "#{description}. Published: #{published}."

      private

      attr_reader :record
    end
  end
end
