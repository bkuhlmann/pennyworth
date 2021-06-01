# frozen_string_literal: true

require "forwardable"

module Pennyworth
  module Presenters
    module System
      # Renders system error into a compatible format for use in Alfred script filters.
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
