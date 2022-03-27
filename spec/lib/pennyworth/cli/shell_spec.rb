# frozen_string_literal: true

require "spec_helper"

RSpec.describe Pennyworth::CLI::Shell do
  using Refinements::Pathnames
  using AutoInjector::Stub

  subject(:shell) { described_class.new }

  include_context "with application dependencies"

  before { Pennyworth::CLI::Actions::Import.stub configuration:, kernel:, logger: }

  after { Pennyworth::CLI::Actions::Import.unstub :configuration, :kernel, :logger }

  describe "#call" do
    it "answers encodings script filter items" do
      shell.call %w[--encodings]
      expect(logger.reread).to match(/items.+title.+ASCII-8BIT.+subtitle.+BINARY/)
    end

    it "answers GitHub organization script filter items with valid organization" do
      shell.call %w[--git_hub --organization dry-rb]
      expect(logger.reread).to match(/items.+title.+Branding/)
    end

    it "answers empty GitHub organization script filter items with invalid organization" do
      shell.call %w[--git_hub --organization acme-23ce5c4735]
      expect(logger.reread).to eq("#{{items: []}.to_json}\n")
    end

    it "answers GitHub user script filter items with valid user" do
      shell.call %w[--git_hub --user bkuhlmann]
      expect(logger.reread).to match(/items.+title.+Alfred/)
    end

    it "answers empty GitHub user script filter items with invalid user" do
      shell.call %w[--git_hub --user bogus-59ddb7b2a4]
      expect(logger.reread).to eq("#{{items: []}.to_json}\n")
    end

    it "answers RubyGems owner script filter items with valid owner" do
      shell.call %w[--ruby_gems --owner bkuhlmann]
      expect(logger.reread).to match(/items.+title.+Auther/)
    end

    it "answers empty RubyGems owner script filter items with invalid owner" do
      shell.call %w[--ruby_gems --owner bogus-59ddb7b2a4]
      expect(logger.reread).to eq("#{{items: []}.to_json}\n")
    end

    it "answers HTTP statuses script filter items" do
      shell.call %w[--http_statuses]
      expect(logger.reread).to match(/items.+title.+200.+subtitle.+OK/)
    end

    it "answers system errors script filter items" do
      shell.call %w[--system_errors]
      expect(logger.reread).to match(/items.+title.+Errno::EACCES.+subtitle.+Permission denied/)
    end

    it "answers system signals script filter items" do
      shell.call %w[--system_signals]
      expect(logger.reread).to match(/items.+title.+ABRT.+subtitle.+6/)
    end

    it "answers text script filter items" do
      shell.call %w[--text test]
      expect(logger.reread).to match(/items.+title.+TEST/)
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
      shell.call %w[--version]
      expect(logger.reread).to match(/Pennyworth\s\d+\.\d+\.\d+/)
    end

    it "prints help" do
      shell.call %w[--help]
      expect(logger.reread).to match(/Pennyworth.+USAGE.+/m)
    end

    it "prints usage when no options are given" do
      shell.call
      expect(logger.reread).to match(/Pennyworth.+USAGE.+/m)
    end

    it "prints error with invalid option" do
      shell.call %w[--bogus]
      expect(logger.reread).to match(/invalid option.+bogus/)
    end
  end
end
