# frozen_string_literal: true

require "spec_helper"

RSpec.describe Pennyworth::CLI::Actions::StandardGems do
  using Refinements::Structs

  subject(:action) { described_class.new processor: }

  include_context "with application dependencies"
  include_context "with Standard Gems integration"

  let(:processor) { instance_spy Pennyworth::Processor, call: [standard_gems_record] }

  describe "#call" do
    it "calls processor with all gems" do
      action.call
      expect(processor).to have_received(:call).with("all_gems.json")
    end

    it "calls processor with specific gem category" do
      action.call "bundled"
      expect(processor).to have_received(:call).with("bundled_gems.json")
    end

    it "answers JSON" do
      action.call
      expect(kernel).to have_received(:puts).with([standard_gems_record].to_json)
    end
  end
end
