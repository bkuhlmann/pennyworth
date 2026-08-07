# frozen_string_literal: true

require "spec_helper"

RSpec.describe Pennyworth::CLI::Actions::RFC do
  using Refinements::StringIO

  subject(:action) { described_class.new }

  include_context "with application dependencies"

  describe "#call" do
    it "answers JSON with valid response" do
      action.call
      expect(io.reread).to match(/items.+title.+RFC 1.+subtitle.+Host Software/)
    end

    it "answers empty items with invalid response" do
      settings.rfc_index_uri = "https://bogus.io"
      action.call

      expect(io.reread).to eq("#{{items: []}.to_json}\n")
    end
  end
end
