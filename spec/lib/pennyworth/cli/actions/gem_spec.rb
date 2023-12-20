# frozen_string_literal: true

require "spec_helper"

RSpec.describe Pennyworth::CLI::Actions::Gem do
  using Refinements::Structs

  subject(:action) { described_class.new processor: }

  include_context "with application dependencies"
  include_context "with RubyGems integration"

  let(:processor) { instance_spy Pennyworth::Processor, call: [ruby_gems_record] }

  describe "#call" do
    it "calls processor with default handle" do
      action.call
      expect(processor).to have_received(:call).with(%r(owners/\w*/gems.json))
    end

    it "calls processor with custom handle" do
      action.call "test"
      expect(processor).to have_received(:call).with("owners/test/gems.json")
    end

    it "answers JSON" do
      action.call "owners/test/gems.json"
      expect(kernel).to have_received(:puts).with([ruby_gems_record].to_json)
    end
  end
end
