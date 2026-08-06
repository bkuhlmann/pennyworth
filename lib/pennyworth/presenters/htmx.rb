# frozen_string_literal: true

require "forwardable"

module Pennyworth
  module Presenters
    # Shapes a htmx record for serialization.
    class HTMX
      extend Forwardable

      delegate Models::HTMX.members => :record

      def initialize record
        @record = record
      end

      alias id label

      private

      attr_reader :record
    end
  end
end
