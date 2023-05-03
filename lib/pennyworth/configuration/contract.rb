# frozen_string_literal: true

require "dry/schema"

Dry::Schema.load_extensions :monads

module Pennyworth
  module Configuration
    Contract = Dry::Schema.Params do
      optional(:alfred_preferences).filled :string
      required(:inflections).array :hash
      required(:git_hub_api_url).filled :string
      optional(:git_hub_organization).filled :string
      optional(:git_hub_user).filled :string
      required(:http_statuses_url).filled :string
      required(:ruby_gems_api_url).filled :string
      optional(:ruby_gems_owner).filled :string
    end
  end
end
