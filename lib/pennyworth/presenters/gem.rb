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

      def label = inflector.call(id.titleize)

      def subtitle
        "Version: #{version}. " \
        "Updated: #{updated_at[..9]}. " \
        "Licenses: #{licenses}. " \
        "Downloads: #{downloads}."
      end

      def version = record.fetch(__method__)

      def licenses = record.fetch(__method__).join(", ")

      def downloads = record.fetch(__method__)

      def site_url = record.fetch(:homepage_uri)

      def source_url = record.fetch(:source_code_uri)

      def changes_url = record.fetch(:changelog_uri)

      def issues_url = record.fetch(:bug_tracker_uri)

      def updated_at = record.fetch(:version_created_at)

      private

      attr_reader :record, :inflector
    end
  end
end
