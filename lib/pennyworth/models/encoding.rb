# frozen_string_literal: true

module Pennyworth
  module Models
    # Defines an encoding.
    Encoding = Struct.new :name, :aliases, keyword_init: true
  end
end
