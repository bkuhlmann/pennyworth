# frozen_string_literal: true

module Pennyworth
  # :reek:ModuleInitialize
  module Models
    # Defines HTTP status details.
    HTTPStatus = Data.define :code, :label, :url do
      def initialize code: nil, label: nil, url: nil
        super
      end
    end
  end
end
