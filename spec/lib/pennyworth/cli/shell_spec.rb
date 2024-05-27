# frozen_string_literal: true

require "spec_helper"

RSpec.describe Pennyworth::CLI::Shell do
  using Refinements::Pathname

  subject(:shell) { described_class.new }

  include_context "with application dependencies"

  before { Sod::Container.stub! kernel:, logger: }

  after { Sod::Container.restore }

  describe "#call" do
    it "prints configuration usage" do
      shell.call %w[config]
      expect(kernel).to have_received(:puts).with(/Manage configuration.+/m)
    end

    it "answers encodings script filter items" do
      shell.call %w[--encodings]
      expect(kernel).to have_received(:puts).with(/items.+title.+ASCII-8BIT.+subtitle.+BINARY/)
    end

    it "answers GitHub organization script filter items with valid organization" do
      shell.call %w[git_hub --organization dry-rb]
      expect(kernel).to have_received(:puts).with(/items.+title.+Branding/)
    end

    it "answers empty GitHub organization script filter items with invalid organization" do
      shell.call %w[git_hub --organization acme-23ce5c4735]
      expect(kernel).to have_received(:puts).with({items: []}.to_json)
    end

    it "answers GitHub user script filter items with valid user" do
      shell.call %w[git_hub --user bkuhlmann]
      expect(kernel).to have_received(:puts).with(/items.+title.+Archiver/)
    end

    it "answers empty GitHub user script filter items with invalid user" do
      shell.call %w[git_hub --user bogus-59ddb7b2a4]
      expect(kernel).to have_received(:puts).with({items: []}.to_json)
    end

    it "answers RubyGems owner script filter items with valid owner" do
      shell.call %w[--gems bkuhlmann]
      expect(kernel).to have_received(:puts).with(/items.+title.+Auther/)
    end

    it "answers empty RubyGems owner script filter items with invalid owner" do
      shell.call %w[--gems bogus-59ddb7b2a4]
      expect(kernel).to have_received(:puts).with({items: []}.to_json)
    end

    it "answers Standard Gems script filter items with valid kind" do
      shell.call %w[--standard_gems bundled]
      expect(kernel).to have_received(:puts).with(/items.+title.+Debug/)
    end

    it "answers HTTP statuses script filter items" do
      shell.call %w[--http_statuses]
      expect(kernel).to have_received(:puts).with(/items.+title.+200.+subtitle.+OK/)
    end

    it "answers standard errors script filter items" do
      shell.call %w[--standard_errors]
      expect(kernel).to have_received(:puts).with(/.+title.+ArgumentError.+arg.+ArgumentError/)
    end

    it "answers system errors script filter items" do
      shell.call %w[--system_errors]

      expect(kernel).to have_received(:puts).with(
        /items.+title.+Errno::EACCES.+subtitle.+Permission denied/
      )
    end

    it "answers system signals script filter items" do
      shell.call %w[--system_signals]
      expect(kernel).to have_received(:puts).with(/items.+title.+ABRT.+subtitle.+6/)
    end

    it "answers text script filter items" do
      shell.call %w[--text test]
      expect(kernel).to have_received(:puts).with(/items.+title.+TEST/)
    end

    it "prints version" do
      shell.call %w[--version]
      expect(kernel).to have_received(:puts).with(/Pennyworth\s\d+\.\d+\.\d+/)
    end

    it "prints help" do
      shell.call %w[--help]
      expect(kernel).to have_received(:puts).with(/Pennyworth.+USAGE.+/m)
    end
  end
end
