# frozen_string_literal: true

module Pennyworth
  module Models
    # Represents a RFC link.
    RFC = Data.define :number, :label, :description, :published, :uri
  end
end
