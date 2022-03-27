# frozen_string_literal: true

require "spec_helper"

RSpec.describe Pennyworth::CLI::Parsers::GitHub do
  using Refinements::Structs

  subject(:parser) { described_class.new test_configuration }

  include_context "with application dependencies"

  it_behaves_like "a parser"

  describe "#call" do
    context "with default configuration" do
      let(:test_configuration) { configuration.dup }

      it "answers custom organization" do
        expect(parser.call(%w[--organization test])).to have_attributes(
          git_hub_organization: "test"
        )
      end

      it "answers custom user" do
        expect(parser.call(%w[--user test])).to have_attributes(git_hub_user: "test")
      end
    end

    context "with custom configuration" do
      let :test_configuration do
        configuration.merge git_hub_organization: "acme", git_hub_user: "demo"
      end

      it "answers default organization" do
        expect(parser.call(%w[--organization])).to have_attributes(git_hub_organization: "acme")
      end

      it "answers custom organization" do
        expect(parser.call(%w[--organization test])).to have_attributes(
          git_hub_organization: "test"
        )
      end

      it "answers default user" do
        expect(parser.call(%w[--user])).to have_attributes(git_hub_user: "demo")
      end

      it "answers custom user" do
        expect(parser.call(%w[--user test])).to have_attributes(git_hub_user: "test")
      end
    end
  end
end
