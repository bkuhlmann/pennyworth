# frozen_string_literal: true

require "spec_helper"
require "http"

RSpec.describe Pennyworth::Loaders::Projects do
  subject(:adapter) { described_class.new client: client }

  include_context "with GitHub integration"

  let(:client) { class_spy HTTP, get: [git_hub_record] }

  describe ".for_git_hub" do
    it "answers new instance" do
      expect(described_class.for_git_hub).to be_a(described_class)
    end
  end

  describe ".for_ruby_gems" do
    it "answers new instance" do
      expect(described_class.for_ruby_gems).to be_a(described_class)
    end
  end

  describe "#call" do
    it "answers records converted as presenters" do
      expect(adapter.call("users/bkuhlmann/repos")).to contain_exactly(git_hub_record)
    end
  end
end
