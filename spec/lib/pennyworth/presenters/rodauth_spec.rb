# frozen_string_literal: true

require "spec_helper"

RSpec.describe Pennyworth::Presenters::Rodauth do
  subject(:presenter) { described_class.new record }

  let :record do
    Pennyworth::Models::Rodauth[
      name: "base",
      label: "Base",
      description: "Shared behavior for other features.",
      uri: "https://rodauth.jeremyevans.net/rdoc/files/doc/base_rdoc.html"
    ]
  end

  describe "#id" do
    it "answers ID" do
      expect(presenter.id).to eq("base")
    end
  end

  describe "#label" do
    it "answers label" do
      expect(presenter.label).to eq("Base")
    end
  end

  describe "#description" do
    it "answers description" do
      expect(presenter.description).to eq("Shared behavior for other features.")
    end
  end

  describe "#uri" do
    it "answers URI" do
      expect(presenter.uri).to eq("https://rodauth.jeremyevans.net/rdoc/files/doc/base_rdoc.html")
    end
  end
end
