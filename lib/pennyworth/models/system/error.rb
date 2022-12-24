# frozen_string_literal: true

module Pennyworth
  module Models
    module System
      # Defines a system error.
      Error = Data.define :id, :name, :description
    end
  end
end
