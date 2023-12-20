# frozen_string_literal: true

require "rack"

module Pennyworth
  module Loaders
    # Loads an array of HTTP status records.
    class HTTPStatus
      include Import[:configuration]

      def initialize(codes: Rack::Utils::HTTP_STATUS_CODES, model: Models::HTTPStatus, **)
        super(**)
        @codes = codes
        @model = model
      end

      def call(*)
        codes.map { |(code, label)| model[code:, label:, url: "#{url}/#{code}"] }
      end

      private

      attr_reader :codes, :model

      def url = configuration.http_statuses_url
    end
  end
end
