# frozen_string_literal: true

module Pennyworth
  module Serializers
    # Serializes a project presenter for parsing by Alfred script filters.
    class Project
      def initialize presenter
        @presenter = presenter
      end

      def to_h
        {
          uid: presenter.id,
          title: presenter.label,
          subtitle: presenter.subtitle,
          arg: site_uri,
          quicklookurl: site_uri,
          mods: modifications,
          text:
        }
      end

      private

      attr_reader :presenter

      def modifications
        {
          alt: modification(presenter.source_uri, "View source."),
          cmd: modification(presenter.issues_uri, "View issues."),
          control: modification(presenter.versions_uri, "View versions.")
        }
      end

      def modification argument, subtitle
        {
          subtitle:,
          arg: argument
        }
      end

      def text
        {
          copy: site_uri,
          largetype: site_uri
        }
      end

      def site_uri = presenter.site_uri
    end
  end
end
