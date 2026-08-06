# frozen_string_literal: true

require "spec_helper"

RSpec.describe Pennyworth::Loaders::RFC do
  subject(:loader) { described_class.new }

  include_context "with application dependencies"

  describe "#call" do
    let :records do
      [
        Pennyworth::Models::RFC[
          number: "1",
          label: "RFC 1",
          description: "Host Software",
          published: "April 1969",
          uri: "https://www.rfc-editor.org/info/rfc1/"
        ],
        Pennyworth::Models::RFC[
          number: "2",
          label: "RFC 2",
          description: "Host software",
          published: "April 1969",
          uri: "https://www.rfc-editor.org/info/rfc2/"
        ]
      ]
    end

    it "answers records" do
      expect(loader.call(settings.rfc_index_uri)).to match(array_including(records))
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

      expect(loader.call(settings.rfc_index_uri)).to eq([])
    end
  end
end
