# frozen_string_literal: true

require "spec_helper"

RSpec.describe Pennyworth::Kits::String do
  describe ".array_to_string" do
    it "answers a string with default settings" do
      expect(Pennyworth::Kits::String.array_to_string([1, 2, 3])).to eq("1 2 3")
    end

    it "answers a string with a custom delimiter" do
      expect(Pennyworth::Kits::String.array_to_string(%w[one two three], "-")).to eq("one-two-three")
    end

    it "raises an ArgumentError when array parameter is missing" do
      expect { Pennyworth::Kits::String.array_to_string }.to raise_error(ArgumentError)
    end
  end

  describe ".downcase" do
    it "answers a downcased string"
  end

  describe ".upcase" do
    it "answers an upcased string"
  end

  describe ".capitalize" do
    it "answers a capitalized string"
  end

  describe ".length" do
    it "answers the string length"
  end
end
