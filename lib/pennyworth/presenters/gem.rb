# frozen_string_literal: true

require "refinements/string"

module Pennyworth
  module Presenters
    # Shapes a RubyGems record for serialization.
    class Gem
      using Refinements::Array
      using Refinements::String

      def initialize record, inflector: Inflector.new
        @record = record
        @inflector = inflector
      end

      def id = record.fetch(:name)

      def label = "#{inflector.call id.titleize} #{version}"

      def subtitle = "Downloads: #{downloads}. Licenses: #{licenses}. Updated: #{updated_at[..9]}."

      def version = record.fetch(__method__)

      def licenses = Array(record.fetch(__method__)).to_sentence

      def downloads = record.fetch(__method__)

      def site_url = record.fetch(:homepage_uri)

      def source_url = record.fetch(:source_code_uri)

      def issues_url = record.fetch(:bug_tracker_uri)

      def versions_url = record.fetch(:changelog_uri)

      def updated_at = record.fetch(:version_created_at)

      private

      attr_reader :record, :inflector
    end
  end
end
