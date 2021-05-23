# frozen_string_literal: true

require "spec_helper"

RSpec.describe Pennyworth::Integrations::GitHub::Client do
  subject(:client) { described_class.new }

  describe "#get" do
    it "answers paginated records when request succeeds" do
      expect(client.get("users/bkuhlmann/repos").size).to be_between(30, 100)
    end

    it "answers zero records when request fails" do
      expect(client.get("users/bogus-57ea1e9940/repos").size).to eq(0)
    end
  end
end
