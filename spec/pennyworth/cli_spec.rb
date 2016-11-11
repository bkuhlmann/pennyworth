# frozen_string_literal: true

require "spec_helper"
require "pennyworth/cli"

RSpec.describe Pennyworth::CLI do
  describe ".start" do
    let(:options) { [] }
    let(:command_line) { Array(command).concat options }
    let :cli do
      lambda do
        load "pennyworth/cli.rb" # Ensures clean Thor `.method_option` evaluation per spec.
        described_class.start command_line
      end
    end

    shared_examples_for "a config command", :temp_dir do
      let(:configuration_path) { File.join temp_dir, Pennyworth::Identity.file_name }
      before { FileUtils.touch configuration_path }

      context "with info option" do
        let(:options) { %w[-i] }

        it "prints configuration path" do
          Dir.chdir(temp_dir) do
            expect(&cli).to output("Using: #{configuration_path}.\n").to_stdout
          end
        end
      end

      context "with no options" do
        it "prints help text" do
          expect(&cli).to output(/Manage gem configuration./).to_stdout
        end
      end
    end

    shared_examples_for "a version command" do
      it "prints version" do
        expect(&cli).to output(/#{Pennyworth::Identity.label}\s#{Pennyworth::Identity.version}\n/).to_stdout
      end
    end

    shared_examples_for "a help command" do
      it "prints usage" do
        expect(&cli).to output(/#{Pennyworth::Identity.label}\s#{Pennyworth::Identity.version}\scommands:\n/).to_stdout
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
