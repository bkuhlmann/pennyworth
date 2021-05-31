# frozen_string_literal: true

module Pennyworth
  module Presenters
    module System
      # Renders strings into a compatible format for use in Alfred script filters.
      class Signal
        def initialize record
          @record = record
        end

        def id = record.number

        def label = record.name

        private

        attr_reader :record
      end
    end
  end
end
