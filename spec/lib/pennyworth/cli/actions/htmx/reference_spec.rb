# frozen_string_literal: true

require "spec_helper"

RSpec.describe Pennyworth::CLI::Actions::HTMX::Reference do
  using Refinements::StringIO

  subject(:action) { described_class.new }

  include_context "with application dependencies"

  describe "#call" do
    it "answers JSON with valid response" do
      action.call
      expect(io.reread).to match(/items.+title.+hx-boost.+subtitle.+Add/)
    end

    it "answers empty items with invalid response" do
      settings.htmx_references_uri = "https://example.com"
      action.call

      expect(io.reread).to eq("#{{items: []}.to_json}\n")
    end
  end
end
