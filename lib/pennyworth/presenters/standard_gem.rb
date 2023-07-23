# frozen_string_literal: true

require "core"
require "refinements/strings"

module Pennyworth
  module Presenters
    # Renders Standard Gem records into a compatible format for use in Alfred script filters.
    class StandardGem
      using Refinements::Arrays
      using Refinements::Strings

      def initialize record, inflector: Inflector.new
        @record = record
        @inflector = inflector
      end

      def id = record.fetch :gem

      def label = "#{inflector.call id.titleize} #{version}"

      def subtitle = record.fetch :description

      def version = record.fetch(:versions, Core::EMPTY_HASH).values.first

      def site_url = record.fetch(:sourceRepository)

      def source_url = record.fetch(:sourceRepository)

      def issues_url = "https://github.com/ruby/#{id}/issues"

      def versions_url = "https://github.com/ruby/#{id}/tags"

      private

      attr_reader :record, :inflector
    end
  end
end
