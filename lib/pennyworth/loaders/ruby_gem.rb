# frozen_string_literal: true

require "core"

module Pennyworth
  module Loaders
    # Loads an array gems from the RubyGems API.
    class RubyGem
      include Import[:configuration, :http]

      def call endpoint
        http.get("#{configuration.ruby_gems_api_url}/#{endpoint}")
            .then do |response|
              return JSON response.body.to_s, symbolize_names: true if response.status.success?

              Core::EMPTY_HASH
            end
      end
    end
  end
end
