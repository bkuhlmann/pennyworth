# frozen_string_literal: true

require "refinements/strings"

module Pennyworth
  module Presenters
    # Renders RubyGems records into a compatible format for use in Alfred script filters.
    class Gem
      using Refinements::Strings

      def initialize record, inflector: Inflector.new
        @record = record
        @inflector = inflector
      end

      def id = record.fetch(:name)

      def label = "#{inflector.call id.titleize} #{version}"

      def subtitle = "Downloads: #{downloads}. Licenses: #{licenses}. Updated: #{updated_at[..9]}."

      def version = record.fetch(__method__)

      def licenses = Array(record.fetch(__method__)).join(", ")

      def downloads = record.fetch(__method__)

      def site_url = record.fetch(:homepage_uri)

      def source_url = record.fetch(:source_code_uri)

      def changes_url
        warn "[DEPRECATION]: #changes_url is deprecated, use #versions_url instead."
        versions_url
      end

      def issues_url = record.fetch(:bug_tracker_uri)

      def versions_url = record.fetch(:changelog_uri)

      def updated_at = record.fetch(:version_created_at)

      private

      attr_reader :record, :inflector
    end
  end
end
