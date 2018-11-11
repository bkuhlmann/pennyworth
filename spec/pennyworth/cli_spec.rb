# frozen_string_literal: true

require "spec_helper"

RSpec.describe Pennyworth::CLI do
  describe ".start" do
    let(:options) { [] }
    let(:command_line) { Array(command).concat options }
    let(:cli) { described_class.start command_line }

    shared_examples_for "a config command", :temp_dir do
      context "with no options" do
        it "prints help text" do
          result = -> { cli }
          expect(&result).to output(/Manage gem configuration./).to_stdout
        end
      end
    end

    shared_examples_for "a version command" do
      it "prints version" do
        pattern = /#{Pennyworth::Identity.version_label}\n/
        result = -> { cli }
        expect(&result).to output(pattern).to_stdout
      end
    end

    shared_examples_for "a help command" do
      it "prints usage" do
        pattern = /#{Pennyworth::Identity.version_label}\scommands:\n/
        result = -> { cli }
        expect(&result).to output(pattern).to_stdout
      end
    end

    describe "--config" do
      let(:command) { "--config" }

      it_behaves_like "a config command"
    end

    describe "-c" do
      let(:command) { "-c" }

      it_behaves_like "a config command"
    end

    describe "--version" do
      let(:command) { "--version" }

      it_behaves_like "a version command"
    end

    describe "-v" do
      let(:command) { "-v" }

      it_behaves_like "a version command"
    end

    describe "--help" do
      let(:command) { "--help" }

      it_behaves_like "a help command"
    end

    describe "-h" do
      let(:command) { "-h" }

      it_behaves_like "a help command"
    end

    context "with no command" do
      let(:command) { nil }

      it_behaves_like "a help command"
    end
  end
end
