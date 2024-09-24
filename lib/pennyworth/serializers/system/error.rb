# frozen_string_literal: true

module Pennyworth
  module Serializers
    module System
      # Serializes a system error presenter for parsing by Alfred script filters.
      class Error
        def initialize presenter
          @presenter = presenter
        end

        def to_h
          {
            uid: id,
            title: id,
            subtitle: presenter.subtitle,
            arg: label,
            mods: modifications,
            text: {copy: label, largetype: label}
          }
        end

        private

        attr_reader :presenter

        def id = presenter.id

        def label = presenter.label

        def description = presenter.description

        def modifications
          {
            control: {subtitle: "Copy ID.", arg: id},
            alt: {subtitle: "Copy description.", arg: description},
            cmd: {
              subtitle: "Copy ID, name, and description.",
              arg: "#{id}, #{label}, #{description}"
            }
          }
        end
      end
    end
  end
end
