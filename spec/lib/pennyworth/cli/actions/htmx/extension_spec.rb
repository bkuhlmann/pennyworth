# frozen_string_literal: true

require "spec_helper"

RSpec.describe Pennyworth::CLI::Actions::HTMX::Extension do
  using Refinements::StringIO

  subject(:action) { described_class.new }

  include_context "with application dependencies"

  describe "#call" do
    it "answers JSON with valid response" do
      action.call
      expect(io.reread).to match(/items.+title.+ajax-header.+subtitle.+Adds/)
    end

    it "answers empty items with invalid response" do
      settings.htmx_extensions_uri = "https://httpstat.us/500"
      action.call

      expect(io.reread).to eq("#{{items: []}.to_json}\n")
    end
  end
end
