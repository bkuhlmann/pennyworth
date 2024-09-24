# frozen_string_literal: true

module Pennyworth
  module Serializers
    # Serializes a htmx presenter for parsing by Alfred script filters.
    class HTMX
      def initialize presenter
        @presenter = presenter
      end

      def to_h
        {
          uid: presenter.id,
          title: presenter.label,
          subtitle: presenter.description,
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
          alt: modification(presenter.label, "Copy label."),
          cmd: modification(presenter.description, "Copy description.")
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

      def site_url = presenter.uri
    end
  end
end
