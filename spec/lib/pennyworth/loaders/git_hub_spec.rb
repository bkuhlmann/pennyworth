# frozen_string_literal: true

require "spec_helper"

RSpec.describe Pennyworth::Loaders::GitHub do
  subject(:client) { described_class.new }

  describe "#call" do
    it "answers paginated records when request succeeds" do
      expect(client.call("users/bkuhlmann").size).to be_between(30, 100)
    end

    it "answers empty array when request fails" do
      expect(client.call("users/bogus-57ea1e9940")).to eq([])
    end
  end
end
