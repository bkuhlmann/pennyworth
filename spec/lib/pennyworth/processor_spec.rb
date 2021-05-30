# frozen_string_literal: true

require "spec_helper"

RSpec.describe Pennyworth::Processor do
  subject(:processor) { described_class.for_text }

  describe ".for_encodings" do
    it "answers new instance" do
      expect(described_class.for_encodings).to be_a(described_class)
    end
  end

  describe ".for_gems" do
    it "answers new instance" do
      expect(described_class.for_gems).to be_a(described_class)
    end
  end

  describe ".for_http_statuses" do
    it "answers new instance" do
      expect(described_class.for_http_statuses).to be_a(described_class)
    end
  end

  describe ".for_projects" do
    it "answers new instance" do
      expect(described_class.for_projects).to be_a(described_class)
    end
  end

  describe ".for_system_signals" do
    it "answers new instance" do
      expect(described_class.for_system_signals).to be_a(described_class)
    end
  end

  describe ".for_system_errors" do
    it "answers new instance" do
      expect(described_class.for_system_errors).to be_a(described_class)
    end
  end

  describe ".for_text" do
    it "answers new instance" do
      expect(described_class.for_text).to be_a(described_class)
    end
  end

  describe "#call" do
    let :proof do
      hash_including(
        items: array_including(
          hash_including(
            uid: "size",
            title: "10",
            subtitle: "Size",
            arg: 10,
            icon: {path: "text/size.png"},
            text: {copy: 10, largetype: 10}
          )
        )
      )
    end

    it "answers serialized items sorted by title" do
      expect(processor.call("an Example")).to match(proof)
    end
  end
end
