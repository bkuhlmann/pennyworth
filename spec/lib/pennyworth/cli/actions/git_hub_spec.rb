# frozen_string_literal: true

require "spec_helper"

RSpec.describe Pennyworth::CLI::Actions::GitHub do
  using Refinements::Structs

  subject(:action) { described_class.new processor: }

  include_context "with application dependencies"
  include_context "with GitHub integration"

  let(:processor) { instance_spy Pennyworth::Processor, call: [git_hub_record] }

  describe "#call" do
    it "calls processor with API endpoint" do
      action.call "orgs/acme"
      expect(processor).to have_received(:call).with("orgs/acme")
    end

    it "answers JSON" do
      action.call "orgs/acme"
      expect(kernel).to have_received(:puts).with([git_hub_record].to_json)
    end
  end
end
