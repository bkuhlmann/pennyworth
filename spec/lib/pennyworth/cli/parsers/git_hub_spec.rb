# frozen_string_literal: true

require "spec_helper"

RSpec.describe Pennyworth::CLI::Parsers::GitHub do
  using Refinements::Structs

  subject(:parser) { described_class.new configuration }

  include_context "with application container"

  it_behaves_like "a parser"

  describe "#call" do
    let(:configuration) { application_configuration }

    it "answers organization with organization flag" do
      parser.call %w[--organization test]
      expect(configuration.action_git_hub).to eq(:organization)
    end

    context "with default configuration and custom organization" do
      let(:configuration) { application_configuration }

      it "answers overwritten default value" do
        parser.call %w[--organization test]
        expect(configuration.git_hub_organization).to eq("test")
      end
    end

    context "with custom configuration and custom organization" do
      let(:configuration) { application_configuration.merge git_hub_organization: "demo" }

      it "answers overwritten custom value" do
        parser.call %w[--organization test]
        expect(configuration.git_hub_organization).to eq("test")
      end
    end

    context "with custom configuration and no organization" do
      let(:configuration) { application_configuration.merge git_hub_organization: "demo" }

      it "answers overwritten custom value" do
        parser.call %w[--organization]
        expect(configuration.git_hub_organization).to eq("demo")
      end
    end

    it "answers user with user flag" do
      parser.call %w[--user test]
      expect(configuration.action_git_hub).to eq(:user)
    end

    context "with default configuration and custom user" do
      let(:configuration) { application_configuration }

      it "answers overwritten default value" do
        parser.call %w[--user test]
        expect(configuration.git_hub_user).to eq("test")
      end
    end

    context "with custom configuration and custom user" do
      let(:configuration) { application_configuration.merge git_hub_user: "demo" }

      it "answers overwritten custom value" do
        parser.call %w[--user test]
        expect(configuration.git_hub_user).to eq("test")
      end
    end

    context "with custom configuration and no user" do
      let(:configuration) { application_configuration.merge git_hub_user: "demo" }

      it "answers overwritten custom value" do
        parser.call %w[--user]
        expect(configuration.git_hub_user).to eq("demo")
      end
    end
  end
end
