# frozen_string_literal: true

RSpec.shared_examples "a parser" do
  describe ".call" do
    it "answers empty array" do
      expect(described_class.call).to be_a(Pennyworth::Configuration::Content)
    end
  end
end
