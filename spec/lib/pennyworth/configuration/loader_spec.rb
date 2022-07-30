# frozen_string_literal: true

require "spec_helper"

RSpec.describe Pennyworth::Configuration::Loader do
  subject(:loader) { described_class.with_defaults }

  let :content do
    Pennyworth::Configuration::Content.new(
      inflections: [
        {"Bkuhlmann" => "bkuhlmann"},
        {"Dry Auto Inject" => "Dry AutoInject"},
        {"Dry Cli" => "Dry CLI"},
        {"Flacsmith" => "FLACsmith"},
        {"Git Plus" => "Git+"},
        {"Http Fake" => "HTTP Fake"},
        {"Mac Os Config" => "macOS Configuration"},
        {"Mac Os" => "MacOS"},
        {"Pkce" => "PKCE"},
        {"Prawn Plus" => "Prawn+"},
        {"Rubocop Ast" => "Rubocop AST"},
        {"Rubocop Md" => "Rubocop Markdown"},
        {"Rubocop Rspec" => "Rubocop RSpec"},
        {"Tty Box" => "TTY Box"},
        {"Tty Color" => "TTY Color"},
        {"Tty Command" => "TTY Command"},
        {"Tty Config" => "TTY Config"},
        {"Tty Cursor" => "TTY Cursor"},
        {"Tty Editor" => "TTY Editor"},
        {"Tty File" => "TTY File"},
        {"Tty Font" => "TTY Font"},
        {"Tty Link" => "TTY Link"},
        {"Tty Logger" => "TTY Logger"},
        {"Tty Markdown" => "TTY Markdown"},
        {"Tty Option" => "TTY Option"},
        {"Tty Pager" => "TTY Pager"},
        {"Tty Pie" => "TTY Pie"},
        {"Tty Platform" => "TTY Platform"},
        {"Tty Progressbar" => "TTY ProgressBar"},
        {"Tty Prompt" => "TTY Prompt"},
        {"Tty Reader" => "TTY Reader"},
        {"Tty Screen" => "TTY Screen"},
        {"Tty Spinner" => "TTY Spinner"},
        {"Tty Table" => "TTY Table"},
        {"Tty Tree" => "TTY Tree"},
        {"Tty Which" => "TTY Which"},
        {"Xdg" => "XDG"}
      ],
      git_hub_api_url: "https://api.github.com",
      http_statuses_url: "https://developer.mozilla.org/docs/Web/HTTP/Status",
      ruby_gems_api_url: "https://rubygems.org/api/v1"
    )
  end

  describe ".call" do
    it "answers default configuration" do
      expect(described_class.call).to be_a(Pennyworth::Configuration::Content)
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
