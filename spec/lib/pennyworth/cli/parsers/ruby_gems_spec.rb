# frozen_string_literal: true

require "spec_helper"

RSpec.describe Pennyworth::CLI::Parsers::RubyGems do
  using Refinements::Structs

  subject(:parser) { described_class.new configuration }

  include_context "with application container"

  it_behaves_like "a parser"

  describe "#call" do
    context "with default configuration and custom owner" do
      let(:configuration) { application_configuration }

      it "answers overwritten default value" do
        parser.call %w[--owner test]
        expect(configuration.ruby_gems_owner).to eq("test")
      end
    end

    context "with custom configuration and custom owner" do
      let(:configuration) { application_configuration.merge ruby_gems_owner: "demo" }

      it "answers overwritten custom value" do
        parser.call %w[--owner test]
        expect(configuration.ruby_gems_owner).to eq("test")
      end
    end

    context "with custom configuration and no owner" do
      let(:configuration) { application_configuration.merge ruby_gems_owner: "demo" }

      it "answers overwritten custom value" do
        parser.call %w[--owner]
        expect(configuration.ruby_gems_owner).to eq("demo")
      end
    end
  end
end
