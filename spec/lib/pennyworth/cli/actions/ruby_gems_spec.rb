# frozen_string_literal: true

require "spec_helper"

RSpec.describe Pennyworth::CLI::Actions::RubyGems do
  using Refinements::Structs

  subject(:action) { described_class.new processor: }

  include_context "with application dependencies"
  include_context "with RubyGems integration"

  let(:processor) { instance_spy Pennyworth::Processor, call: [ruby_gems_record] }

  describe "#call" do
    it "calls processor with API endpoint" do
      action.call "owners/test/gems.json"
      expect(processor).to have_received(:call).with("owners/test/gems.json")
    end

    it "answers JSON" do
      action.call "owners/test/gems.json"
      expect(kernel).to have_received(:puts).with([ruby_gems_record].to_json)
    end
  end
end
