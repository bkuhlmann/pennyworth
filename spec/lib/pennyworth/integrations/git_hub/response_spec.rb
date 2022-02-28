# frozen_string_literal: true

require "spec_helper"
require "http"

RSpec.describe Pennyworth::Integrations::GitHub::Response do
  subject(:response) { described_class.new raw }

  let :raw do
    HTTP::Response.new request: HTTP::Request.new(verb: :get, uri: "https://www.example.com"),
                       headers: {
                         "Link" => "<https://api.github.com/user/0/repos?page=3>; rel=\"next\", " \
                                   "<https://api.github.com/user/0/repos?page=10>; rel=\"last\""
                       },
                       body: [{text: "test"}].to_json,
                       status:,
                       version: "1.1"
  end

  let(:status) { 200 }

  describe "#next_page" do
    it "answers next page when link exists" do
      expect(response.next_page).to eq(3)
    end

    it "answers zero when link doesn't exists" do
      raw["Link"] = nil
      expect(response.next_page).to eq(0)
    end
  end

  describe "#last_page" do
    it "answers last page when link exists" do
      expect(response.last_page).to eq(10)
    end

    it "answers zero when link doesn't exists" do
      raw["Link"] = nil
      expect(response.last_page).to eq(0)
    end
  end

  describe "#records" do
    it "answers records when successful" do
      expect(response.records).to eq([text: "test"])
    end

    context "with failure status" do
      let(:status) { 400 }

      it "answers empty array" do
        expect(response.records).to eq([])
      end
    end
  end

  describe "#success?" do
    it "answers true when success" do
      expect(response.success?).to be(true)
    end

    context "when failure" do
      let(:status) { 400 }

      it "answers false" do
        expect(response.success?).to be(false)
      end
    end
  end
end
