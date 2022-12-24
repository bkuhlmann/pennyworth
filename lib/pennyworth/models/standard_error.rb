# frozen_string_literal: true

module Pennyworth
  # :reek:ModuleInitialize
  module Models
    # Defines a standard error.
    StandardError = Data.define :name, :file_path, :line_number do
      def initialize name: nil, file_path: nil, line_number: nil
        super
      end
    end
  end
end
