# frozen_string_literal: true

require "spec_helper"

RSpec.describe Pennyworth::CLI::Configuration::Loader do
  subject(:loader) { described_class.with_defaults }

  let :content do
    Pennyworth::CLI::Configuration::Content.new(
      inflections: [
        {"Bkuhlmann" => "bkuhlmann"},
        {"Dry Auto Inject" => "Dry AutoInject"},
        {"Dry Cli" => "Dry CLI"},
        {"Flacsmith" => "FLACsmith"},
        {"Git Plus" => "Git+"},
        {"Mac Os Config" => "macOS Configuration"},
        {"Mac Os" => "MacOS"},
        {"Prawn Plus" => "Prawn+"},
        {"Rubocop Ast" => "Rubocop AST"},
        {"Rubocop Md" => "Rubocop Markdown"},
        {"Rubocop Rspec" => "Rubocop RSpec"},
        {"Xdg" => "XDG"}
      ],
      git_hub_api_url: "https://api.github.com",
      http_statuses_url: "https://httpstatuses.com",
      ruby_gems_api_url: "https://rubygems.org/api/v1"
    )
  end

  describe ".call" do
    it "answers default configuration" do
      expect(described_class.call).to be_a(Pennyworth::CLI::Configuration::Content)
    end
  end

  describe ".with_defaults" do
    it "answers default configuration" do
      expect(described_class.with_defaults.call).to eq(content)
    end
  end

  describe "#call" do
    it "answers default configuration" do
      expect(loader.call).to eq(content)
    end
  end
end
