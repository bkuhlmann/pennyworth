# frozen_string_literal: true

require "spec_helper"

RSpec.describe Pennyworth::Loaders::RubyGem do
  subject(:client) { described_class.new }

  describe "#call" do
    it "answers paginated records when request succeeds" do
      expect(client.call("owners/bkuhlmann/gems.json").size).to be_between(10, 50)
    end

    it "answers zero records when request fails" do
      expect(client.call("owners/bogus-57ea1e9940/gems.json").size).to eq(0)
    end
  end
end
