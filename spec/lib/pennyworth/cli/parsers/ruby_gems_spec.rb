# frozen_string_literal: true

require "spec_helper"

RSpec.describe Pennyworth::CLI::Parsers::RubyGems do
  using Refinements::Structs

  subject(:parser) { described_class.new test_configuration }

  include_context "with application container"

  it_behaves_like "a parser"

  describe "#call" do
    context "with default configuration" do
      let(:test_configuration) { configuration.dup }

      it "answers custom owner" do
        expect(parser.call(%w[--owner test])).to have_attributes(ruby_gems_owner: "test")
      end
    end

    context "with custom configuration" do
      let(:test_configuration) { configuration.merge ruby_gems_owner: "demo" }

      it "answers default owner" do
        expect(parser.call(%w[--owner])).to have_attributes(ruby_gems_owner: "demo")
      end

      it "answers custom owner" do
        expect(parser.call(%w[--owner test])).to have_attributes(ruby_gems_owner: "test")
      end
    end
  end
end
