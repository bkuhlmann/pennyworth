# frozen_string_literal: true

require "spec_helper"

RSpec.describe Pennyworth::Loaders::Rodauth do
  subject(:loader) { described_class.new }

  include_context "with application dependencies"

  describe "#call" do
    let :features do
      [
        Pennyworth::Models::Rodauth[
          name: "base",
          label: "Base",
          description: "Shared behavior for other features.",
          uri: "https://rodauth.jeremyevans.net/rdoc/files/doc/base_rdoc.html"
        ],
        Pennyworth::Models::Rodauth[
          name: "email_base",
          label: "Email Base",
          description: "Shared behavior for features that require sending email.",
          uri: "https://rodauth.jeremyevans.net/rdoc/files/doc/email_base_rdoc.html"
        ]
      ]
    end

    it "answers features" do
      expect(loader.call(settings.rodauth_documentation_uri)).to match(array_including(features))
    end

    it "answers empty array with invalid status" do
      http = class_double HTTP,
                          get: HTTP::Response.new(
                            uri: "https://rodauth.jeremyevans.net",
                            verb: :get,
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
