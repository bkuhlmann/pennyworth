# frozen_string_literal: true

require "spec_helper"

RSpec.describe Pennyworth::Kits::Clipboard do
  describe ".clip" do
    let(:text) { "Well, hello, I am a test string." }

    it "answers the same text as supplied" do
      expect(Pennyworth::Kits::Clipboard).to receive("copy").and_return(@text)
      expect(Pennyworth::Kits::Clipboard.copy(@text)).to eq(@text)
    end

    it "raises an ArgumentError when parameter is missing" do
      expect { Pennyworth::Kits::Clipboard.copy }.to raise_error(ArgumentError)
    end
  end
end
