# frozen_string_literal: true

require "spec_helper"

RSpec.describe Pennyworth::CLI::Actions::StandardError do
  using Refinements::StringIO

  subject(:action) { described_class.new }

  include_context "with application dependencies"
  include_context "with temporary directory"

  let(:logger) { Cogger.new id: :pennyworth, io: log_path }
  let(:log_path) { temp_dir.join "standard_errors.json" }

  describe "#call" do
    it "answers JSON" do
      action.call
      expect(io.reread).to match(/.+title.+ArgumentError.+arg.+ArgumentError/)
    end
  end
end
