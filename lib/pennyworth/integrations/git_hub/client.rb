# frozen_string_literal: true

require "refinements/arrays"

module Pennyworth
  module Integrations
    module GitHub
      # Provides low-level API access to the GitHub API.
      class Client
        using Refinements::Arrays

        HEADERS = {
          accept: "application/vnd.github.v3+json",
          content_type: "Content-Type: application/json; charset=utf-8"
        }.freeze

        def initialize headers: HEADERS, container: Container
          @headers = headers
          @container = container
        end

        def get endpoint, parameters: {}
          paginate ->(page) { sole_get endpoint, parameters: parameters.merge(page:) }
        end

        private

        attr_reader :headers, :container

        # :reek:FeatureEnvy
        def paginate request, records: [], page: 1
          response = request.call page

          records.including(response.records)
                 .then do |updated_records|
                   return updated_records if response.last_page.zero?

                   paginate request, records: updated_records, page: response.next_page
                 end
        end

        def sole_get endpoint, parameters: {}
          http.headers(headers)
              .basic_auth(user: api_login, pass: api_token)
              .get("#{api_url}/#{endpoint}", params: parameters)
              .then { |response| Response.new response }
        end

        def http = container[__method__]

        def api_url = container[:configuration].git_hub_api_url

        def api_login = container[:environment].fetch("GITHUB_API_LOGIN")

        def api_token = container[:environment].fetch("GITHUB_API_TOKEN")
      end
    end
  end
end
