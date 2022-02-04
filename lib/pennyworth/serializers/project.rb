# frozen_string_literal: true

module Pennyworth
  module Serializers
    # Serializes a project into a compatible format for parsing within Alfred script filters.
    class Project
      def initialize presenter
        @presenter = presenter
      end

      def to_h
        {
          uid: presenter.id,
          title: presenter.label,
          subtitle: presenter.subtitle,
          arg: site_url,
          quicklookurl: site_url,
          mods: modifications,
          text:
        }
      end

      private

      attr_reader :presenter

      def modifications
        {
          alt: modification(presenter.source_url, "View source."),
          cmd: modification(presenter.issues_url, "View issues."),
          control: modification(presenter.versions_url, "View versions.")
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
          copy: site_url,
          largetype: site_url
        }
      end

      def site_url = presenter.site_url
    end
  end
end
