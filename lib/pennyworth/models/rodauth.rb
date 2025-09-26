# frozen_string_literal: true

module Pennyworth
  module Models
    # Represents a Rodauth list item.
    Rodauth = Data.define :name, :label, :description, :uri
  end
end
