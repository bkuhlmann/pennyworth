# frozen_string_literal: true

require "spec_helper"

RSpec.describe Pennyworth::CLI::Shell do
  using Refinements::Pathnames

  subject(:shell) { described_class.new }

  include_context "with application container"

  describe "#call" do
    it "answers encodings script filter items" do
      results = proc { shell.call %w[--encodings] }
      expect(&results).to output(/items.+title.+ASCII-8BIT.+subtitle.+BINARY/).to_stdout
    end

    it "answers GitHub organization script filter items with valid organization" do
      results = proc { shell.call %w[--git_hub --organization dry-rb] }
      expect(&results).to output(/items.+title.+Branding/).to_stdout
    end

    it "answers empty GitHub organization script filter items with invalid organization" do
      results = proc { shell.call %w[--git_hub --organization acme-23ce5c4735] }
      expect(&results).to output("#{{items: []}.to_json}\n").to_stdout
    end

    it "answers GitHub user script filter items with valid user" do
      results = proc { shell.call %w[--git_hub --user bkuhlmann] }
      expect(&results).to output(/items.+title.+Alfred/).to_stdout
    end

    it "answers empty GitHub user script filter items with invalid user" do
      results = proc { shell.call %w[--git_hub --user bogus-59ddb7b2a4] }
      expect(&results).to output("#{{items: []}.to_json}\n").to_stdout
    end

    it "answers RubyGems owner script filter items with valid owner" do
      results = proc { shell.call %w[--ruby_gems --owner bkuhlmann] }
      expect(&results).to output(/items.+title.+Auther/).to_stdout
    end

    it "answers empty RubyGems owner script filter items with invalid owner" do
      results = proc { shell.call %w[--ruby_gems --owner bogus-59ddb7b2a4] }
      expect(&results).to output("#{{items: []}.to_json}\n").to_stdout
    end

    it "answers HTTP statuses script filter items" do
      results = proc { shell.call %w[--http_statuses] }
      expect(&results).to output(/items.+title.+200.+subtitle.+OK/).to_stdout
    end

    it "answers system errors script filter items" do
      results = proc { shell.call %w[--system_errors] }

      expect(&results).to output(
        /items.+title.+Errno::EACCES.+subtitle.+Permission denied/
      ).to_stdout
    end

    it "answers system signals script filter items" do
      results = proc { shell.call %w[--system_signals] }
      expect(&results).to output(/items.+title.+ABRT.+subtitle.+6/).to_stdout
    end

    it "answers text script filter items" do
      results = proc { shell.call %w[--text test] }
      expect(&results).to output(/items.+title.+TEST/).to_stdout
    end

    it "edits configuration" do
      shell.call %w[--config edit]
      expect(kernel).to have_received(:system).with(include("EDITOR"))
    end

    it "views configuration" do
      shell.call %w[--config view]
      expect(kernel).to have_received(:system).with(include("cat"))
    end

    it "prints version" do
      result = proc { shell.call %w[--version] }
      expect(&result).to output(/Pennyworth\s\d+\.\d+\.\d+/).to_stdout
    end

    it "prints help" do
      result = proc { shell.call %w[--help] }
      expect(&result).to output(/Pennyworth.+USAGE.+/m).to_stdout
    end

    it "prints usage when no options are given" do
      result = proc { shell.call }
      expect(&result).to output(/Pennyworth.+USAGE.+/m).to_stdout
    end

    it "prints error with invalid option" do
      result = proc { shell.call %w[--bogus] }
      expect(&result).to output(/invalid option.+bogus/).to_stdout
    end
  end
end
