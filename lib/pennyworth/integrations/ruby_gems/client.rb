# frozen_string_literal: true

module Pennyworth
  module Integrations
    module RubyGems
      # Provides low-level API access to the RubyGems API.
      class Client
        include Import[:configuration, :http]

        def get endpoint
          http.get("#{configuration.ruby_gems_api_url}/#{endpoint}")
              .then do |response|
                response.status.success? ? JSON(response.body.to_s, symbolize_names: true) : {}
              end
        end
      end
    end
  end
end
