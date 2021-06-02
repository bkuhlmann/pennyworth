# frozen_string_literal: true

module Pennyworth
  module Models
    # Defines HTTP status details.
    HTTPStatus = Struct.new :code, :label, :url, keyword_init: true
  end
end
