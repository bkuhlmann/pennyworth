# frozen_string_literal: true

require "spec_helper"

RSpec.describe Pennyworth::Presenters::RFC do
  subject(:presenter) { described_class.new record }

  let :record do
    Pennyworth::Models::RFC[
      number: 1,
      label: "RFC 1",
      description: "Host Software",
      published: "April 1969",
      uri: "https://www.rfc-editor.org/info/rfc1"
    ]
  end

  describe "#id" do
    it "answers ID" do
      expect(presenter.id).to eq(1)
    end
  end

  describe "#label" do
    it "answers label" do
      expect(presenter.label).to eq("RFC 1")
    end
  end

  describe "#description" do
    it "answers description" do
      expect(presenter.description).to eq("Host Software")
    end
  end

  describe "#subtitle" do
    it "answers subtitle" do
      expect(presenter.subtitle).to eq("Host Software. Published: April 1969.")
    end
  end

  describe "#uri" do
    it "answers URI" do
      expect(presenter.uri).to eq("https://www.rfc-editor.org/info/rfc1")
    end
  end
end
