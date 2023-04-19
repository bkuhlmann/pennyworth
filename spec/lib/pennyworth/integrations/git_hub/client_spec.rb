# frozen_string_literal: true

require "spec_helper"

RSpec.describe Pennyworth::Integrations::GitHub::Client do
  subject(:client) { described_class.new }

  describe "#get" do
    it "answers paginated records when request succeeds" do
      pending "Requires updated CI keys" if ENV.fetch("CI", false) == "true"
      expect(client.get("users/bkuhlmann").size).to be_between(30, 100)
    end

    it "answers empty array when request fails" do
      expect(client.get("users/bogus-57ea1e9940")).to eq([])
    end
  end
end
