# frozen_string_literal: true

module Pennyworth
  module Models
    # Defines a standard error.
    StandardError = Struct.new :name, :file_path, :line_number, keyword_init: true
  end
end
