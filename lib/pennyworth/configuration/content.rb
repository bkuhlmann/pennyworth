# frozen_string_literal: true

module Pennyworth
  module Configuration
    # Defines configuration content as the primary source of truth for use throughout the gem.
    Content = Struct.new :action_encodings,
                         :action_git_hub,
                         :action_http_statuses,
                         :action_ruby_gems,
                         :action_system_errors,
                         :action_system_signals,
                         :action_text,
                         :action_config,
                         :action_version,
                         :action_help,
                         :alfred_preferences,
                         :inflections,
                         :git_hub_api_url,
                         :git_hub_organization,
                         :git_hub_user,
                         :http_statuses_url,
                         :ruby_gems_api_url,
                         :ruby_gems_owner,
                         keyword_init: true
  end
end
