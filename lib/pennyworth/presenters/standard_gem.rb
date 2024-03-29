# frozen_string_literal: true

require "core"
require "refinements/string"

module Pennyworth
  module Presenters
    # Renders Standard Gem records into a compatible format for use in Alfred script filters.
    class StandardGem
      using Refinements::Array
      using Refinements::String

      def initialize record, inflector: Inflector.new
        @record = record
        @inflector = inflector
      end

      def id = record.fetch :gem

      def label = "#{inflector.call id.titleize} #{version}"

      def subtitle = record.fetch :description

      # :reek:FeatureEnvy
      def version
        versions = record.fetch :versions, Core::EMPTY_HASH
        (versions[:bundled] || versions[:default] || versions).values.first
      end

      def site_url = record.fetch(:sourceRepository, Core::EMPTY_STRING)

      def source_url = record.fetch(:sourceRepository, Core::EMPTY_STRING)

      def issues_url = "https://github.com/ruby/#{id}/issues"

      def versions_url = "https://github.com/ruby/#{id}/tags"

      private

      attr_reader :record, :inflector
    end
  end
end
