# frozen_string_literal: true

require "spec_helper"

RSpec.describe Pennyworth::Loaders::Text do
  subject(:loader) { described_class.new }

  describe "#call" do
    it "answers sorted records" do
      expect(loader.call("an Example")).to contain_exactly(
        Pennyworth::Models::Text[id: "camelcase", content: "AnExample"],
        Pennyworth::Models::Text[id: "capitalize", content: "An example"],
        Pennyworth::Models::Text[id: "downcase", content: "an example"],
        Pennyworth::Models::Text[id: "size", content: 10],
        Pennyworth::Models::Text[id: "snakecase", content: "an_example"],
        Pennyworth::Models::Text[id: "titleize", content: "An Example"],
        Pennyworth::Models::Text[id: "upcase", content: "AN EXAMPLE"]
      )
    end
  end
end
