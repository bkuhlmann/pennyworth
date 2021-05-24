# frozen_string_literal: true

require "spec_helper"

RSpec.describe Pennyworth::Inflector do
  subject(:inflector) { described_class.new "api" => "API" }

  describe "#call" do
    it "answers original string when not found" do
      expect(inflector.call("test")).to eq("test")
    end

    it "answers inflected string when exact match" do
      expect(inflector.call("api")).to eq("API")
    end
  end
end
