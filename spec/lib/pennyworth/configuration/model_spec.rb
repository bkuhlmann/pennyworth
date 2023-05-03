# frozen_string_literal: true

require "spec_helper"

RSpec.describe Pennyworth::Configuration::Model do
  subject(:content) { described_class.new }

  describe "#initialize" do
    let :proof do
      {
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
