# frozen_string_literal: true

module Pennyworth
  module Models
    module System
      # Defines a system error.
      Error = Struct.new :id, :name, :description, keyword_init: true
    end
  end
end
