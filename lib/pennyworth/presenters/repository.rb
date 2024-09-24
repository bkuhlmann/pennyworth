# frozen_string_literal: true

require "refinements/string"

module Pennyworth
  module Presenters
    # Shapes a repository record for serialization.
    class Repository
      using Refinements::String

      def initialize record, inflector: Inflector.new
        @record = record
        @inflector = inflector
      end

      def id = record.fetch(:name)

      def label = inflector.call(id.titleize)

      def subtitle = record.fetch(:description)

      def site_url = record.fetch(:homepage)

      def source_url = record.fetch(:html_url)

      def issues_url = "#{source_url}/issues"

      def versions_url = "#{site_url}/versions"

      private

      attr_reader :record, :inflector
    end
  end
end
