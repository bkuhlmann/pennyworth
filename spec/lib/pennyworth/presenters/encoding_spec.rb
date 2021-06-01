# frozen_string_literal: true

require "spec_helper"

RSpec.describe Pennyworth::Presenters::Encoding do
  subject(:presenter) { described_class.new record }

  let(:record) { Pennyworth::Models::Encoding[name: "ASCII-8BIT", aliases: %w[BINARY]] }

  describe "#id" do
    it "answers ID" do
      expect(presenter.id).to eq("ASCII-8BIT")
    end
  end

  describe "#label" do
    it "answers label" do
      expect(presenter.label).to eq("ASCII-8BIT")
    end
  end

  describe "#aliases" do
    it "answers aliases" do
      expect(presenter.aliases).to contain_exactly("BINARY")
    end
  end
end
