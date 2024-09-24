# frozen_string_literal: true

module Pennyworth
  module Serializers
    module System
      # Serializes a system signal presenter for parsing by Alfred script filters.
      class Signal
        def initialize presenter
          @presenter = presenter
        end

        def to_h
          {
            uid: id,
            title: label,
            subtitle: id,
            arg: label,
            mods: modifications,
            text: {copy: label, largetype: label}
          }
        end

        private

        attr_reader :presenter

        def id = presenter.id

        def label = presenter.label

        def modifications
          {
            alt: {subtitle: "Copy ID.", arg: id},
            cmd: {subtitle: "Copy ID and name.", arg: "#{id}, #{label}"}
          }
        end
      end
    end
  end
end
