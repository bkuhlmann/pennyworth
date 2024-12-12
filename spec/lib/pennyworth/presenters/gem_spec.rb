# frozen_string_literal: true

require "spec_helper"

RSpec.describe Pennyworth::Presenters::Gem do
  subject(:presenter) { described_class.new ruby_gems_record }

  include_context "with RubyGems integration"

  describe "#id" do
    it "answers ID" do
      expect(presenter.id).to eq("test")
    end
  end

  describe "#label" do
    it "answers label" do
      expect(presenter.label).to eq("Test 0.1.0")
    end
  end

  describe "#subtitle" do
    it "answwers subtitle" do
      expect(presenter.subtitle).to eq("Downloads: 1000. Licenses: MIT. Updated: 2021-05-20.")
    end
  end

  describe "#version" do
    it "answers version" do
      expect(presenter.version).to eq("0.1.0")
    end
  end

  describe "#licenses" do
    it "answers single license" do
      expect(presenter.licenses).to eq("MIT")
    end

    it "answers multiple licenses" do
      ruby_gems_record[:licenses] = %w[MIT Apache]
      expect(presenter.licenses).to eq("MIT and Apache")
    end

    it "answers empty string with missing licenses" do
      ruby_gems_record[:licenses] = nil
      expect(presenter.licenses).to eq("")
    end
  end

  describe "#downloads" do
    it "answers current download" do
      expect(presenter.downloads).to eq(1_000)
    end
  end

  describe "#updated_at" do
    it "answers updated at date/time" do
      expect(presenter.updated_at).to eq("2021-05-20T09:10:15.123Z")
    end
  end

  describe "#site_uri" do
    it "answers site URI" do
      expect(presenter.site_uri).to eq("https://site.example.com")
    end
  end

  describe "#source_uri" do
    it "answers source URI" do
      expect(presenter.source_uri).to eq("https://source.example.com")
    end
  end

  describe "#issues_uri" do
    it "answers issues URI" do
      expect(presenter.issues_uri).to eq("https://issues.example.com")
    end
  end

  describe "#versions_uri" do
    it "answers versions URI" do
      expect(presenter.versions_uri).to eq("https://changes.example.com")
    end
  end
end
