# frozen_string_literal: true

require "spec_helper"

RSpec.describe Pennyworth::Presenters::HTMX do
  subject(:presenter) { described_class.new record }

  let :record do
    Pennyworth::Models::HTMX[
      label: "hx-get",
      description: "Issues HTTP GET request.",
      uri: "https://htmx.org/attributes/hx-get"
    ]
  end

  describe "#id" do
    it "answers ID" do
      expect(presenter.id).to eq("hx-get")
    end
  end

  describe "#label" do
    it "answers label" do
      expect(presenter.label).to eq("hx-get")
    end
  end

  describe "#description" do
    it "answers description" do
      expect(presenter.description).to eq("Issues HTTP GET request.")
    end
  end

  describe "#uri" do
    it "answers URI" do
      expect(presenter.uri).to eq("https://htmx.org/attributes/hx-get")
    end
  end
end
