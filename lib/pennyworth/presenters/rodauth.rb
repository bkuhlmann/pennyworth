# frozen_string_literal: true

require "forwardable"

module Pennyworth
  module Presenters
    # Shapes a Rodauth record for serialization.
    class Rodauth
      extend Forwardable

      delegate Models::Rodauth.members => :record

      def initialize record
        @record = record
      end

      alias id name

      private

      attr_reader :record
    end
  end
end
