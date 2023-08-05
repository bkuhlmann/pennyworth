# frozen_string_literal: true

require "core"

module Pennyworth
  module Integrations
    module StandardGems
      # Provides low-level API access to the Standard Gems API.
      class Client
        include Import[:configuration, :http]

        def get endpoint
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
end
