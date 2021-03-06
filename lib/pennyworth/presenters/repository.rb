# frozen_string_literal: true

require "refinements/strings"

module Pennyworth
  module Presenters
    # Renders a GitHub repository record into a compatible format for use in Alfred script filters.
    class Repository
      using Refinements::Strings

      def initialize record, inflector: Inflector.new
        @record = record
        @inflector = inflector
      end

      def id = record.fetch(:name)

      def label = inflector.call(id.titleize)

      def subtitle = record.fetch(:description)

      def site_url = record.fetch(:homepage)

      def source_url = record.fetch(:html_url)

      def changes_url = "#{site_url}/changes.html"

      def issues_url = "#{source_url}/issues"

      private

      attr_reader :record, :inflector
    end
  end
end
