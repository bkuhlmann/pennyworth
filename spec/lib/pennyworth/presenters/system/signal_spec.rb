# frozen_string_literal: true

require "spec_helper"

RSpec.describe Pennyworth::Presenters::System::Signal do
  subject(:presenter) { described_class.new record }

  let(:record) { Pennyworth::Models::System::Signal[number: 30, name: "USR1"] }

  describe "#id" do
    it "answers ID" do
      expect(presenter.id).to eq(30)
    end
  end

  describe "#label" do
    it "answers label" do
      expect(presenter.label).to eq("USR1")
    end
  end
end
