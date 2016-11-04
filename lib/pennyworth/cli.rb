# frozen_string_literal: true

require "yaml"
require "thor"
require "thor/actions"
require "thor_plus/actions"
require "refinements/strings"
require "runcom"

module Pennyworth
  # The Command Line Interface (CLI) for the gem.
  # rubocop:disable Metrics/ClassLength
  class CLI < Thor
    include Thor::Actions
    include ThorPlus::Actions
    using Refinements::Strings

    package_name Pennyworth::Identity.version_label

    def self.source_root
      File.expand_path File.join(File.dirname(__FILE__), "templates")
    end

    def self.defaults
      {}
    end

    def initialize args = [], options = {}, config = {}
      super args, options, config
      @configuration = Runcom::Configuration.new file_name: Identity.file_name, defaults: self.class.defaults
    end

    desc "-s, [--string=STRING]", "Manipulate strings."
    map %w[-s --string] => :string
    method_option :downcase,
                  aliases: "-d",
                  desc: "Downcase string.",
                  type: :boolean,
                  default: false
    method_option :upcase,
                  aliases: "-u",
                  desc: "Upcase string.",
                  type: :boolean,
                  default: false
    method_option :titleize,
                  aliases: "-t",
                  desc: "Capitalize each word and delimit with space or forward slash.",
                  type: :boolean,
                  default: false
    method_option :camelcase,
                  aliases: "-c",
                  desc: "Capitalize each word and delimit with nothing or double colon.",
                  type: :boolean,
                  default: false
    method_option :snakecase,
                  aliases: "-s",
                  desc: "Downcase each word and delimit with underscore or forward slash.",
                  type: :boolean,
                  default: false
    method_option :size,
                  aliases: "-s",
                  desc: "Calculate string size.",
                  type: :boolean,
                  default: false
    # rubocop:disable Metrics/CyclomaticComplexity
    # rubocop:disable Metrics/PerceivedComplexity
    def string value
      if options.downcase? then say(value.downcase)
      elsif options.upcase? then say(value.upcase)
      elsif options.titleize? then say(value.titleize)
      elsif options.camelcase? then say(value.camelcase)
      elsif options.snakecase? then say(value.snakecase)
      elsif options.size? then say(value.size)
      else say("Type 'pennyworth help string' for usage.")
      end
    end

    desc "-i, [--install]", "Install Alfred Workflows."
    map %w[-i --install] => :install
    def install
      say

      alfred_settings_root = configuration.to_h[:alfred_settings_root]

      if valid_file?(alfred_settings_root, "Invalid directory for Alfred settings root")
        if yes? "Installing Alfred Workflows will destroy exiting workflows of the same name. Continue (y/n)?"
          info "Installing Alfred Workflows..."

          workflows = Dir.glob File.join(self.class.source_root, "workflows", "**")
          alfred_workflows_root = File.join alfred_settings_root, "workflows"
          workflows.each do |workflow|
            name = File.basename workflow
            destination = File.join alfred_workflows_root, name
            remove_file destination
            directory File.join("workflows", name), destination
          end

          info "Alfred Workflows installed."
        else
          info "Alfred Workflows installation cancelled."
        end
      else
        error "Invalid Alfred settings directory: #{alfred_settings_root}"
      end

      say
    end

    desc "-c, [--config]", "Manage gem configuration."
    map %w[-c --config] => :config
    method_option :edit, aliases: "-e", desc: "Edit gem configuration.", type: :boolean, default: false
    method_option :info, aliases: "-i", desc: "Print gem configuration info.", type: :boolean, default: false
    def config
      if options.edit? then `#{editor} #{configuration.computed_path}`
      elsif options.info? then say("Using: #{configuration.computed_path}.")
      else help(:config)
      end
    end

    desc "-v, [--version]", "Show gem version."
    map %w[-v --version] => :version
    def version
      say Pennyworth::Identity.version_label
    end

    desc "-h, [--help=HELP]", "Show this message or get help for a command."
    map %w[-h --help] => :help
    def help task = nil
      say and super
    end

    private

    attr_reader :configuration
  end
end
