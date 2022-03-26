# frozen_string_literal: true

require "spec_helper"

RSpec.describe Pennyworth::CLI::Parser do
  subject(:parser) { described_class.new }

  describe "#call" do
    it "answers hash with valid option" do
      configuration = parser.call %w[--help]
      expect(configuration).to have_attributes(action_help: true)
    end

    it "answers configuration content by default" do
      expect(parser.call).to be_a(Pennyworth::Configuration::Content)
    end

    it "fails with invalid option" do
      expectation = proc { parser.call %w[--bogus] }
      expect(&expectation).to raise_error(OptionParser::InvalidOption, /--bogus/)
    end
  end

  describe "#to_s" do
    it "answers usage" do
      parser.call
      expect(parser.to_s).to match(/.+USAGE.+/m)
    end
  end
end
