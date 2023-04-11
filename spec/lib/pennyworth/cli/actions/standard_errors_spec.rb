# frozen_string_literal: true

require "spec_helper"

RSpec.describe Pennyworth::CLI::Actions::StandardErrors do
  subject(:action) { described_class.new }

  include_context "with application dependencies"
  include_context "with temporary directory"

  let(:logger) { Cogger.new io: log_path }
  let(:log_path) { temp_dir.join "standard_errors.json" }

  describe "#call" do
    it "answers JSON" do
      action.call
      expect(kernel).to have_received(:puts).with(/.+title.+ArgumentError.+arg.+ArgumentError/)
    end
  end
end
