# frozen_string_literal: true

require "spec_helper"

RSpec.describe Pennyworth::CLI::Actions::StandardGem do
  using Refinements::StringIO
  using Refinements::Struct

  subject(:action) { described_class.new processor: }

  include_context "with application dependencies"
  include_context "with Standard Gems integration"

  let(:processor) { instance_spy Pennyworth::Processor, call: [standard_gems_record] }

  describe "#call" do
    it "calls processor with all gems by default" do
      action.call
      expect(processor).to have_received(:call).with("stdgems.json")
    end

    it "calls processor with all gems" do
      action.call "all"
      expect(processor).to have_received(:call).with("stdgems.json")
    end

    it "calls processor with bundled gems" do
      action.call "bundled"
      expect(processor).to have_received(:call).with("bundled_gems.json")
    end

    it "calls processor with default gems" do
      action.call "default"
      expect(processor).to have_received(:call).with("default_gems.json")
    end

    it "fails with invalid gems" do
      expectation = proc { action.call "bogus" }
      expect(&expectation).to raise_error(KeyError, /bogus/)
    end

    it "answers JSON" do
      action.call
      expect(io.reread).to match([standard_gems_record].to_json)
    end
  end
end
