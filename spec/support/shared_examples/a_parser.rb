# frozen_string_literal: true

RSpec.shared_examples "a parser" do
  describe ".call" do
    it "answers empty array" do
      parser = described_class.call Pennyworth::Configuration::Content.new, client: OptionParser.new
      expect(parser).to eq([])
    end
  end
end
