# frozen_string_literal: true

require "spec_helper"

RSpec.describe Pennyworth::Processor do
  subject(:processor) { Pennyworth::Container["processors.text"] }

  describe "#initialize" do
    it "is frozen" do
      expect(processor.frozen?).to be(true)
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
