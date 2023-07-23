# frozen_string_literal: true

require "core"

module Pennyworth
  module Integrations
    module StandardGems
      # Provides low-level API access to the Standard Gems API.
      class Client
        include Import[:configuration, :http]

        # Order matters.
        ENDPOINTS = %w[bundled_gems.json default_gems.json].freeze

        def initialize(endpoints: ENDPOINTS, **)
          @endpoints = endpoints
          super(**)
        end

        def get endpoint
          if endpoints.include? endpoint then load_category endpoint
          elsif endpoint == "all_gems.json" then all
          else Core::EMPTY_ARRAY
          end
        end

        private

        attr_reader :endpoints

        # :reek:FeatureEnvy
        # :reek:DuplicateMethodCall
        def all
          load_all.sort_by! { |element| element[:gem] }
                  .uniq! { |element| element[:gem] }
                  .then { |collection| collection || Core::EMPTY_ARRAY }
        end

        def load_all
          endpoints.reduce [] do |collection, endpoint|
            collection.append(*load_category(endpoint))
          end
        end

        def load_category endpoint
          http.get("#{configuration.standard_gems_api_url}/#{endpoint}")
              .then do |response|
                response.status.success? ? records(response.body.to_s) : Core::EMPTY_HASH
              end
        end

        def records(body) = JSON(body, symbolize_names: true).fetch :gems, Core::EMPTY_ARRAY
      end
    end
  end
end
