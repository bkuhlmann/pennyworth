# frozen_string_literal: true

require "forwardable"

module Pennyworth
  module Presenters
    module System
      # Shapes a system error record for serialization.
      class Error
        extend Forwardable

        delegate %i[id description] => :record

        def initialize record
          @record = record
        end

        def label = record.name

        def subtitle = "#{label}: #{description}."

        private

        attr_reader :record
      end
    end
  end
end
