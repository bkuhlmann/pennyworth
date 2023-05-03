# frozen_string_literal: true

require "spec_helper"

RSpec.describe Pennyworth::Configuration::Model do
  subject(:content) { described_class.new }

  describe "#initialize" do
    let :proof do
      {
        action_encodings: nil,
        action_git_hub: nil,
        action_http_statuses: nil,
        action_ruby_gems: nil,
        action_standard_errors: nil,
        action_system_errors: nil,
        action_system_signals: nil,
        action_text: nil,
        action_config: nil,
        action_version: nil,
        action_help: nil,
        alfred_preferences: nil,
        inflections: nil,
        git_hub_api_url: nil,
        git_hub_organization: nil,
        git_hub_user: nil,
        http_statuses_url: nil,
        ruby_gems_api_url: nil,
        ruby_gems_owner: nil
      }
    end

    it "answers default attributes" do
      expect(content).to have_attributes(proof)
    end
  end
end
