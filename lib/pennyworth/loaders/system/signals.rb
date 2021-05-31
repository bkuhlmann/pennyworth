# frozen_string_literal: true

module Pennyworth
  module Loaders
    module System
      # Loads an array of signal records.
      class Signals
        def initialize list: Signal.list, model: Models::System::Signal
          @list = list
          @model = model
        end

        def call(_omit = nil) = list.map { |name, number| model[number: number, name: name] }

        private

        attr_reader :list, :model
      end
    end
  end
end
