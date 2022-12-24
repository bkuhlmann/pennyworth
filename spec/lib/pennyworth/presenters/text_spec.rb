# frozen_string_literal: true

require "spec_helper"

RSpec.describe Pennyworth::Presenters::Text do
  subject(:presenter) { described_class.new record }

  let(:record) { Pennyworth::Models::Text[id: "abc", content: "test"] }

  describe "#id" do
    it "answers ID" do
      expect(presenter.id).to eq("abc")
    end
  end

  describe "#label" do
    it "answers label" do
      expect(presenter.label).to eq("test")
    end

    context "with integer content" do
      let(:record) { Pennyworth::Models::Text[id: "abc", content: 10] }

      it "answers string label" do
        expect(presenter.label).to eq("10")
      end
    end
  end

  describe "#content" do
    it "answers content" do
      expect(presenter.content).to eq("test")
    end
  end
end
