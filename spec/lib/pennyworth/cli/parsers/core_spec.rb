# frozen_string_literal: true

require "spec_helper"

RSpec.describe Pennyworth::CLI::Parsers::Core do
  subject(:parser) { described_class.new configuration.dup }

  include_context "with application dependencies"

  it_behaves_like "a parser"

  describe "#call" do
    it "answers config edit (short)" do
      expect(parser.call(%w[-c edit])).to have_attributes(action_config: :edit)
    end

    it "answers config edit (long)" do
      expect(parser.call(%w[--config edit])).to have_attributes(action_config: :edit)
    end

    it "answers config view (short)" do
      expect(parser.call(%w[-c view])).to have_attributes(action_config: :view)
    end

    it "answers config view (long)" do
      expect(parser.call(%w[--config view])).to have_attributes(action_config: :view)
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
      expect(parser.call(%w[--encodings])).to have_attributes(action_encodings: true)
    end

    it "enables GitHub" do
      expect(parser.call(%w[--git_hub])).to have_attributes(action_git_hub: true)
    end

    it "enables HTTP statuses" do
      expect(parser.call(%w[--http_statuses])).to have_attributes(action_http_statuses: true)
    end

    it "enables RubyGems" do
      expect(parser.call(%w[--ruby_gems])).to have_attributes(action_ruby_gems: true)
    end

    it "enables system errors" do
      expect(parser.call(%w[--system_errors])).to have_attributes(action_system_errors: true)
    end

    it "enables system signals" do
      expect(parser.call(%w[--system_signals])).to have_attributes(action_system_signals: true)
    end

    it "answers text content" do
      expect(parser.call(%w[--text test])).to have_attributes(action_text: "test")
    end

    it "answers version (short)" do
      expect(parser.call(%w[-v])).to have_attributes(action_version: true)
    end

    it "answers version (long)" do
      expect(parser.call(%w[--version])).to have_attributes(action_version: true)
    end

    it "enables help (short)" do
      expect(parser.call(%w[-h])).to have_attributes(action_help: true)
    end

    it "enables help (long)" do
      expect(parser.call(%w[--help])).to have_attributes(action_help: true)
    end
  end
end
