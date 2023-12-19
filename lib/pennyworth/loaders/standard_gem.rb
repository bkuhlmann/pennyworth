# frozen_string_literal: true

require "core"

module Pennyworth
  module Loaders
    # Loads an array gems from the Standard Gems API.
    class StandardGem
      include Import[:configuration, :http]

      def call endpoint
        http.get("#{configuration.standard_gems_api_url}/#{endpoint}")
            .then do |response|
              response.status.success? ? records(response.body.to_s) : Core::EMPTY_HASH
            end
      end

      private

      def records(body) = JSON(body, symbolize_names: true).fetch :gems, Core::EMPTY_ARRAY
    end
  end
end
