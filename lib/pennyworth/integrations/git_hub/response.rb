# frozen_string_literal: true

module Pennyworth
  module Integrations
    module GitHub
      # Represents a generic GitHub API response.
      class Response
        def initialize raw
          @raw = raw
        end

        def next_page = page("next")

        def last_page = page("last")

        def records = success? ? JSON(raw.body, symbolize_names: true) : []

        def success? = raw.status.success?

        private

        attr_reader :raw

        def page reference
          links.find { |link| link.include? reference }
               .then { |link| String(link)[/page=(?<page>\d+)/, :page].to_i }
        end

        def links = String(raw.headers["Link"]).split(", ")
      end
    end
  end
end
