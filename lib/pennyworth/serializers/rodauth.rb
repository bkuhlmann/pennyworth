# frozen_string_literal: true

module Pennyworth
  module Serializers
    # Serializes a Rodauth presenter for parsing by Alfred script filters.
    class Rodauth
      def initialize presenter
        @presenter = presenter
      end

      def to_h
        {
          uid: presenter.id,
          title: presenter.label,
          subtitle: presenter.description,
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
          alt: modification(presenter.label, "Copy label."),
          cmd: modification(presenter.description, "Copy description."),
          control: modification(presenter.name, "Copy name.")
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

      def site_uri = presenter.uri
    end
  end
end
