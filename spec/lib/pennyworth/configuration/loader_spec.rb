# frozen_string_literal: true

require "spec_helper"
require "yaml"

RSpec.describe Pennyworth::Configuration::Loader do
  subject(:loader) { described_class.with_defaults }

  let :content do
    Pennyworth::Configuration::Content.new(
      inflections: YAML.load_file(SPEC_ROOT.join("support/fixtures/inflections.yml"))[:inflections],
      git_hub_api_url: "https://api.github.com",
      http_statuses_url: "https://developer.mozilla.org/docs/Web/HTTP/Status",
      ruby_gems_api_url: "https://rubygems.org/api/v1"
    )
  end

  describe ".call" do
    it "answers default configuration" do
      expect(described_class.call).to be_a(Pennyworth::Configuration::Content)
    end
  end

  describe ".with_defaults" do
    it "answers default configuration" do
      expect(described_class.with_defaults.call).to eq(content)
    end
  end

  describe "#call" do
    it "answers default configuration" do
      expect(loader.call).to eq(content)
    end
  end
end
