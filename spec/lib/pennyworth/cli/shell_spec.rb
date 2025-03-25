# frozen_string_literal: true

require "spec_helper"

RSpec.describe Pennyworth::CLI::Shell do
  using Refinements::Pathname
  using Refinements::StringIO

  subject(:shell) { described_class.new }

  include_context "with application dependencies"

  before { Sod::Container.stub! logger:, io: }

  after { Sod::Container.restore }

  describe "#call" do
    it "prints configuration usage" do
      shell.call %w[config]
      expect(io.reread).to match(/Manage configuration.+/m)
    end

    it "answers encodings script filter items" do
      shell.call %w[--encodings]
      expect(io.reread).to match(/items.+title.+ASCII-8BIT.+subtitle.+BINARY/)
    end

    it "answers GitHub organization script filter items with valid organization" do
      shell.call %w[git_hub --organization dry-rb]
      expect(io.reread).to match(/items.+title.+Branding/)
    end

    it "answers empty GitHub organization script filter items with invalid organization" do
      shell.call %w[git_hub --organization acme-23ce5c4735]
      expect(io.reread).to eq("#{{items: []}.to_json}\n")
    end

    it "answers GitHub user script filter items with valid user" do
      shell.call %w[git_hub --user bkuhlmann]
      expect(io.reread).to match(/items.+title.+Auther/)
    end

    it "answers empty GitHub user script filter items with invalid user" do
      shell.call %w[git_hub --user bogus-59ddb7b2a4]
      expect(io.reread).to eq("#{{items: []}.to_json}\n")
    end

    it "answers htmx examples" do
      shell.call %w[htmx --examples]
      expect(io.reread).to match(/items.+title.+Click To Edit.+subtitle.+Demonstrates/)
    end

    it "answers htmx extensions" do
      shell.call %w[htmx --extensions]
      expect(io.reread).to match(/items.+title.+ajax-header.+subtitle.+Adds/)
    end

    it "answers htmx references" do
      shell.call %w[htmx --references]
      expect(io.reread).to match(/items.+title.+hx-boost.+subtitle.+Add/)
    end

    it "answers RubyGems owner script filter items with valid owner" do
      shell.call %w[--gems bkuhlmann]
      expect(io.reread).to match(/items.+title.+Auther/)
    end

    it "answers empty RubyGems owner script filter items with invalid owner" do
      shell.call %w[--gems bogus-59ddb7b2a4]
      expect(io.reread).to eq("#{{items: []}.to_json}\n")
    end

    it "answers Standard Gems script filter items with valid kind" do
      shell.call %w[--standard_gems bundled]
      expect(io.reread).to match(/items.+title.+Debug/)
    end

    it "answers HTTP statuses script filter items" do
      shell.call %w[--http_statuses]
      expect(io.reread).to match(/items.+title.+200.+subtitle.+OK/)
    end

    it "answers standard errors script filter items" do
      shell.call %w[--standard_errors]
      expect(io.reread).to match(/.+title.+ArgumentError.+arg.+ArgumentError/)
    end

    it "answers system errors script filter items" do
      shell.call %w[--system_errors]

      expect(io.reread).to match(/items.+title.+Errno::EACCES.+subtitle.+Permission denied/)
    end

    it "answers system signals script filter items" do
      shell.call %w[--system_signals]
      expect(io.reread).to match(/items.+title.+ABRT.+subtitle.+6/)
    end

    it "answers text script filter items" do
      shell.call %w[--text test]
      expect(io.reread).to match(/items.+title.+TEST/)
    end

    it "prints version" do
      shell.call %w[--version]
      expect(io.reread).to match(/Pennyworth\s\d+\.\d+\.\d+/)
    end

    it "prints help" do
      shell.call %w[--help]
      expect(io.reread).to match(/Pennyworth.+USAGE.+/m)
    end
  end
end
