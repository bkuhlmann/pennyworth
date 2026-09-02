# frozen_string_literal: true

require "spec_helper"

RSpec.describe Pennyworth::Loaders::HTMX do
  subject(:loader) { described_class.new }

  include_context "with application dependencies"

  describe "#call" do
    let :extensions do
      [
        Pennyworth::Models::HTMX[
          label: "hx-multipart",
          description: "Stream HTML with multipart/mixed.",
          uri: "https://four.htmx.org/extensions/hx-multipart"
        ],
        Pennyworth::Models::HTMX[
          label: "hx-csp",
          description: "Make htmx work under strict Content Security Policy.",
          uri: "https://four.htmx.org/extensions/hx-csp"
        ]
      ]
    end

    let :patterns do
      [
        Pennyworth::Models::HTMX[
          label: "Click to Load",
          description: "Load more items when you click a button.",
          uri: "https://four.htmx.org/patterns/click-to-load"
        ],
        Pennyworth::Models::HTMX[
          label: "Bulk Actions",
          description: "Perform actions on multiple records.",
          uri: "https://four.htmx.org/patterns/bulk-actions"
        ]
      ]
    end

    let :references do
      [
        Pennyworth::Models::HTMX[
          label: "hx-get",
          description: "Issues get request to specified url.",
          uri: "https://four.htmx.org/reference/attributes/hx-get"
        ],
        Pennyworth::Models::HTMX[
          label: "<hx-partial>",
          description: "Targets multiple elements with one response.",
          uri: "https://four.htmx.org/reference/tags/hx-partial"
        ]
      ]
    end

    it "answers extensions" do
      expect(loader.call(settings.htmx_extensions_uri)).to match(array_including(extensions))
    end

    it "answers patterns" do
      expect(loader.call(settings.htmx_patterns_uri)).to match(array_including(patterns))
    end

    it "answers references" do
      expect(loader.call(settings.htmx_references_uri)).to match(array_including(references))
    end

    it "answers empty array with invalid status" do
      http = class_double HTTP,
                          get: HTTP::Response.new(
                            uri: "https://htmx",
                            body: "Danger!",
                            status: 500,
                            version: 1.0
                          )

      loader = described_class.new(http:)

      allow(http).to receive(:follow).and_return(http)

      expect(loader.call("https://httpstat.us/500")).to eq([])
    end
  end
end
