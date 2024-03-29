# frozen_string_literal: true

module Pennyworth
  module Loaders
    module System
      # Loads an array of system error records.
      class Error
        def initialize errno: Errno, model: Models::System::Error
          @errno = errno
          @model = model
        end

        def call(*)
          errno.constants
               .map { |name| errno.const_get name }
               .uniq
               .sort_by { |error| error::Errno }
               .map do |error|
                 model[id: error::Errno, name: error.name, description: error.exception.message]
               end
        end

        private

        attr_reader :errno, :model
      end
    end
  end
end
