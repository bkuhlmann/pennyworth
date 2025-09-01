# frozen_string_literal: true

require "spec_helper"

RSpec.describe Pennyworth::CLI::Actions::GitHub::User do
  using Refinements::StringIO
  using Refinements::Struct

  subject(:action) { described_class.new processor: }

  include_context "with application dependencies"
  include_context "with GitHub integration"

  let(:processor) { instance_spy Pennyworth::Processor, call: [git_hub_record] }

  describe "#call" do
    it "calls processor with default handle" do
      action.call
      expect(processor).to have_received(:call).with(%r(users/\w*))
    end

    it "calls processor with custom handle" do
      action.call "acme"
      expect(processor).to have_received(:call).with("users/acme")
    end

    it "answers JSON" do
      action.call "acme"
      expect(io.reread).to eq("#{[git_hub_record].to_json}\n")
    end
  end
end
