# frozen_string_literal: true

require "spec_helper"

RSpec.describe Pennyworth::Integrations::RubyGems::Client do
  subject(:client) { described_class.new }

  describe "#get" do
    it "answers paginated records when request succeeds" do
      expect(client.get("owners/bkuhlmann/gems.json").size).to be_between(10, 30)
    end

    it "answers zero records when request fails" do
      expect(client.get("owners/bogus-57ea1e9940/gems.json").size).to eq(0)
    end
  end
end
