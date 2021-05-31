# frozen_string_literal: true

module Pennyworth
  module Models
    module System
      # Defines a low-level operating system signal.
      Signal = Struct.new :number, :name, keyword_init: true
    end
  end
end
