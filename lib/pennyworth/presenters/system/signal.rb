# frozen_string_literal: true

module Pennyworth
  module Presenters
    module System
      # Shapes a system signal record for serialization.
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
