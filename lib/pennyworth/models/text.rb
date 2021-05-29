# frozen_string_literal: true

module Pennyworth
  module Models
    # Defines basic text.
    Text = Struct.new :id, :content, keyword_init: true
  end
end
