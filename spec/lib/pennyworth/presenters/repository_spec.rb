# frozen_string_literal: true

require "spec_helper"

RSpec.describe Pennyworth::Presenters::Repository do
  subject(:presenter) { described_class.new git_hub_record }

  include_context "with GitHub integration"

  describe "#id" do
    it "answers ID" do
      expect(presenter.id).to eq("test")
    end
  end

  describe "#label" do
    it "answers label" do
      expect(presenter.label).to eq("Test")
    end
  end

  describe "#subtitle" do
    it "answwers subtitle" do
      expect(presenter.subtitle).to eq("A test project.")
    end
  end

  describe "#site_uri" do
    it "answers site URI" do
      expect(presenter.site_uri).to eq("https://alchemists.io/projects/test")
    end
  end

  describe "#source_uri" do
    it "answers source URI" do
      expect(presenter.source_uri).to eq("https://github.com/bkuhlmann/test")
    end
  end

  describe "#issues_uri" do
    it "answers issues URI" do
      expect(presenter.issues_uri).to eq("https://github.com/bkuhlmann/test/issues")
    end
  end

  describe "#versions_uri" do
    it "answers versions URI" do
      expect(presenter.versions_uri).to eq("https://alchemists.io/projects/test/versions")
    end
  end
end
