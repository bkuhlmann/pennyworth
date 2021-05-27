# frozen_string_literal: true

require "spec_helper"

RSpec.describe Pennyworth::CLI::Actions::GitHub do
  using Refinements::Structs

  subject(:action) { described_class.new processor: processor }

  include_context "with application container"
  include_context "with GitHub integration"

  let(:processor) { instance_spy Pennyworth::Processor, call: [git_hub_record] }

  describe "#call" do
    it "calls processor with API endpoint" do
      action.call "orgs/acme/repos"
      expect(processor).to have_received(:call).with("orgs/acme/repos")
    end

    it "answers JSON" do
      results = proc { action.call "orgs/acme/repos" }
      expect(&results).to output("#{[git_hub_record].to_json}\n").to_stdout
    end
  end
end
