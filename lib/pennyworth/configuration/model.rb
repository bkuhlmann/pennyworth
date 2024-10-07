# frozen_string_literal: true

module Pennyworth
  module Configuration
    # Defines configuration content as the primary source of truth for use throughout the gem.
    Model = Struct.new :alfred_preferences,
                       :inflections,
                       :git_hub_api_url,
                       :git_hub_organization,
                       :git_hub_user,
                       :http_statuses_url,
                       :htmx_examples_uri,
                       :htmx_references_uri,
                       :htmx_site_uri,
                       :ruby_gems_api_url,
                       :ruby_gems_owner,
                       :standard_gems_api_url
  end
end
