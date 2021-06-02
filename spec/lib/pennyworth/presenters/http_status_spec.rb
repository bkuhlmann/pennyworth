# frozen_string_literal: true

require "spec_helper"

RSpec.describe Pennyworth::Presenters::HTTPStatus do
  subject(:presenter) { described_class.new record }

  let :record do
    Pennyworth::Models::HTTPStatus[code: 200, label: "OK", url: "https://httpstatuses.com/200"]
  end

  describe "#id" do
    it "answers ID" do
      expect(presenter.id).to eq(200)
    end
  end

  describe "#code" do
    it "answers code" do
      expect(presenter.code).to eq(200)
    end
  end

  describe "#label" do
    it "answers label" do
      expect(presenter.label).to eq("OK")
    end
  end

  describe "#subtitle" do
    it "answers subtitle" do
      expect(presenter.subtitle).to eq("200 OK")
    end
  end

  describe "#symbol" do
    it "answers symbol" do
      expect(presenter.symbol).to eq(":ok")
    end

    context "with hyphenated label" do
      let(:record) { Pennyworth::Models::HTTPStatus[label: "Multi-Status"] }

      it "answers symbol" do
        expect(presenter.symbol).to eq(":multi_status")
      end
    end

    context "with parenthesis label" do
      let(:record) { Pennyworth::Models::HTTPStatus[label: "(Unused)"] }

      it "answers symbol" do
        expect(presenter.symbol).to eq(":unused")
      end
    end

    context "with IM Used label" do
      let(:record) { Pennyworth::Models::HTTPStatus[label: "IM Used"] }

      it "answers symbol" do
        expect(presenter.symbol).to eq(":im_used")
      end
    end

    context "with URI Too Long label" do
      let(:record) { Pennyworth::Models::HTTPStatus[label: "URI Too Long"] }

      it "answers symbol" do
        expect(presenter.symbol).to eq(":uri_too_long")
      end
    end

    context "with HTTP Version Not Supported label" do
      let(:record) { Pennyworth::Models::HTTPStatus[label: "HTTP Version Not Supported"] }

      it "answers symbol" do
        expect(presenter.symbol).to eq(":http_version_not_supported")
      end
    end
  end

  describe "#url" do
    it "answers URL" do
      expect(presenter.url).to eq("https://httpstatuses.com/200")
    end
  end
end
