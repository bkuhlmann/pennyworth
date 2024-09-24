# frozen_string_literal: true

require "forwardable"
require "refinements/string"

module Pennyworth
  module Presenters
    # Shapes a HTTP status record for serialization.
    class HTTPStatus
      extend Forwardable

      using Refinements::String

      delegate %i[code label url] => :record

      def initialize record, inflector: Inflector.new
        @record = record
        @inflector = inflector
      end

      def id = record.code

      def subtitle = "#{id} #{label}"

      def symbol = ":#{inflector.call name}"

      private

      attr_reader :record, :inflector

      def name
        label.snakecase
             .tr("/", "_")
             .gsub(/(\(|\))/, "")
             .sub("h_t_t_p_version_not_supported", "http_version_not_supported")
             .sub("i_m_used", "im_used")
             .sub("u_r_i_too_long", "uri_too_long")
      end
    end
  end
end
