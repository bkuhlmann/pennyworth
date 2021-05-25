# frozen_string_literal: true

require "spec_helper"

RSpec.describe Pennyworth::CLI::Parsers::Core do
  subject(:parser) { described_class.new configuration }

  let(:configuration) { Pennyworth::CLI::Configuration::Loader.call }

  it_behaves_like "a parser"

  describe "#call" do
    it "answers config edit (short)" do
      parser.call %w[-c edit]
      expect(configuration.action_config).to eq(:edit)
    end

    it "answers config edit (long)" do
      parser.call %w[--config edit]
      expect(configuration.action_config).to eq(:edit)
    end

    it "answers config view (short)" do
      parser.call %w[-c view]
      expect(configuration.action_config).to eq(:view)
    end

    it "answers config view (long)" do
      parser.call %w[--config view]
      expect(configuration.action_config).to eq(:view)
    end

    it "fails with missing config action" do
      expectation = proc { parser.call %w[--config] }
      expect(&expectation).to raise_error(OptionParser::MissingArgument, /--config/)
    end

    it "fails with invalid config action" do
      expectation = proc { parser.call %w[--config bogus] }
      expect(&expectation).to raise_error(OptionParser::InvalidArgument, /bogus/)
    end

    it "enables encodings" do
      parser.call %w[--encodings]
      expect(configuration.action_encodings).to eq(true)
    end

    it "enables GitHub" do
      parser.call %w[--git_hub]
      expect(configuration.action_git_hub).to eq(true)
    end

    it "enables HTTP statuses" do
      parser.call %w[--http_statuses]
      expect(configuration.action_http_statuses).to eq(true)
    end

    it "enables RubyGems" do
      parser.call %w[--ruby_gems]
      expect(configuration.action_ruby_gems).to eq(true)
    end

    it "enables system errors" do
      parser.call %w[--system_errors]
      expect(configuration.action_system_errors).to eq(true)
    end

    it "enables system signals" do
      parser.call %w[--system_signals]
      expect(configuration.action_system_signals).to eq(true)
    end

    it "answers text content" do
      parser.call %w[--text test]
      expect(configuration.action_text).to eq("test")
    end

    it "answers version (short)" do
      parser.call %w[-v]
      expect(configuration.action_version).to match(/Pennyworth\s\d+\.\d+\.\d+/)
    end

    it "answers version (long)" do
      parser.call %w[--version]
      expect(configuration.action_version).to match(/Pennyworth\s\d+\.\d+\.\d+/)
    end

    it "enables help (short)" do
      parser.call %w[-h]
      expect(configuration.action_help).to eq(true)
    end

    it "enables help (long)" do
      parser.call %w[--help]
      expect(configuration.action_help).to eq(true)
    end
  end
end
