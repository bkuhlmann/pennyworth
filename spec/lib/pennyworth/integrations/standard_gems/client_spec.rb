# frozen_string_literal: true

require "spec_helper"

RSpec.describe Pennyworth::Integrations::StandardGems::Client do
  subject(:client) { described_class.new }

  describe "#get" do
    it "answers successful response for all gems" do
      expect(client.get("all_gems.json").size).to be_between(1, 120)
    end

    it "answers successful response for bundled gems" do
      expect(client.get("bundled_gems.json").size).to be_between(1, 50)
    end

    it "answers successful response for default gems" do
      expect(client.get("default_gems.json").size).to be_between(1, 100)
    end

    it "answers empty array when given invalid category" do
      expect(client.get("bogus.json")).to eq([])
    end

    it "answers empty array when unable to reach server" do
      status = instance_double HTTP::Response::Status, success?: false
      response = instance_double(HTTP::Response, status:)
      http = class_double HTTP, get: response
      client = described_class.new(http:)

      expect(client.get("all_gems.json")).to eq([])
    end
  end
end
