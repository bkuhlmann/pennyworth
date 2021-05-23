# frozen_string_literal: true

module Pennyworth
  module Integrations
    module RubyGems
      # Provides low-level API access to the RubyGems API.
      class Client
        def initialize container: Container
          @container = container
        end

        def get endpoint
          http.get("#{api_url}/#{endpoint}")
              .then do |response|
                response.status.success? ? JSON(response.body.to_s, symbolize_names: true) : {}
              end
        end

        private

        attr_reader :container

        def http = container[__method__]

        def api_url = container[:configuration].ruby_gems_api_url
      end
    end
  end
end
