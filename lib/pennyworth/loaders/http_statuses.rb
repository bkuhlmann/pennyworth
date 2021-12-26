# frozen_string_literal: true

require "rack"

module Pennyworth
  module Loaders
    # Loads an array of HTTP status records.
    class HTTPStatuses
      def initialize codes: Rack::Utils::HTTP_STATUS_CODES,
                     model: Models::HTTPStatus,
                     configuration: CLI::Configuration::Loader.call
        @codes = codes
        @model = model
        @configuration = configuration
      end

      def call _omit = nil
        codes.map { |(code, label)| model[code:, label:, url: "#{url}/#{code}"] }
      end

      private

      attr_reader :codes, :model, :configuration

      def url = configuration.http_statuses_url
    end
  end
end
