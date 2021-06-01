# frozen_string_literal: true

require "spec_helper"

RSpec.describe Pennyworth::Presenters::System::Error do
  subject(:presenter) { described_class.new record }

  let :record do
    Pennyworth::Models::System::Error[
      id: 13,
      name: "Errno::EACCES",
      description: "Permission denied"
    ]
  end

  describe "#id" do
    it "answers ID" do
      expect(presenter.id).to eq(13)
    end
  end

  describe "#label" do
    it "answers label" do
      expect(presenter.label).to eq("Errno::EACCES")
    end
  end

  describe "#description" do
    it "answers description" do
      expect(presenter.description).to eq("Permission denied")
    end
  end

  describe "#subtitle" do
    it "answers subtitle" do
      expect(presenter.subtitle).to eq("Errno::EACCES: Permission denied.")
    end
  end
end
