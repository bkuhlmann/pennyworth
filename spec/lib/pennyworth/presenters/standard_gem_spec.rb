# frozen_string_literal: true

require "spec_helper"

RSpec.describe Pennyworth::Presenters::StandardGem do
  subject(:presenter) { described_class.new standard_gems_record }

  include_context "with Standard Gems integration"

  describe "#id" do
    it "answers ID" do
      expect(presenter.id).to eq("test")
    end
  end

  describe "#label" do
    it "answers label" do
      expect(presenter.label).to eq("Test 1.2.3")
    end
  end

  describe "#subtitle" do
    it "answwers subtitle" do
      expect(presenter.subtitle).to eq("A test gem.")
    end
  end

  describe "#version" do
    it "answers version when default key is present" do
      standard_gems_record[:versions] = {default: {"1.2" => "1.2.3"}}
      expect(presenter.version).to eq("1.2.3")
    end

    it "answers version when bundled key is present" do
      standard_gems_record[:versions] = {bundled: {"1.2" => "1.2.3"}}
      expect(presenter.version).to eq("1.2.3")
    end

    it "answers version when no top level keys are present" do
      expect(presenter.version).to eq("1.2.3")
    end
  end

  describe "#site_url" do
    it "answers site URL" do
      expect(presenter.site_url).to eq("https://github.com/ruby/test")
    end

    it "answers empty string when source repository key can't be found" do
      standard_gems_record.delete :sourceRepository
      expect(presenter.site_url).to eq("")
    end
  end

  describe "#source_url" do
    it "answers source URL" do
      expect(presenter.source_url).to eq("https://github.com/ruby/test")
    end

    it "answers empty string when source repository key can't be found" do
      standard_gems_record.delete :sourceRepository
      expect(presenter.source_url).to eq("")
    end
  end

  describe "#issues_url" do
    it "answers issues URL" do
      expect(presenter.issues_url).to eq("https://github.com/ruby/test/issues")
    end
  end

  describe "#versions_url" do
    it "answers versions URL" do
      expect(presenter.versions_url).to eq("https://github.com/ruby/test/tags")
    end
  end
end
