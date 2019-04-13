# frozen_string_literal: true

require "thor"
require "thor/actions"
require "refinements/strings"
require "runcom"

module Pennyworth
  # The Command Line Interface (CLI) for the gem.
  # rubocop:disable Metrics/ClassLength
  class CLI < Thor
    include Thor::Actions
    using Refinements::Strings

    package_name Identity.version_label

    def self.source_root
      File.expand_path File.join(File.dirname(__FILE__), "templates")
    end

    def self.configuration
      Runcom::Config.new Identity.name
    end

    def initialize args = [], options = {}, config = {}
      super args, options, config
    end

    desc "-s, [--string=VALUE]", "Manipulate strings."
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
      if options.downcase? then say value.downcase
      elsif options.upcase? then say value.upcase
      elsif options.titleize? then say value.titleize
      elsif options.camelcase? then say value.camelcase
      elsif options.snakecase? then say value.snakecase
      elsif options.size? then say value.size
      else say "Type 'pennyworth help string' for usage."
      end
    end
    # rubocop:enable Metrics/CyclomaticComplexity
    # rubocop:enable Metrics/PerceivedComplexity

    desc "-i, [--install]", "Install Alfred Workflows."
    map %w[-i --install] => :install
    def install
      say

      alfred_settings_root = self.class.configuration.to_h[:alfred_settings_root]

      if valid_file? alfred_settings_root, "Invalid directory for Alfred settings root"
        if yes? "Installing Alfred Workflows will destroy exiting, identical, workflows. " \
                "Continue (y/n)?"
          say_status :info, "Installing Alfred Workflows...", :green

          workflows = Dir.glob File.join(self.class.source_root, "workflows", "**")
          alfred_workflows_root = File.join alfred_settings_root, "workflows"
          workflows.each do |workflow|
            name = File.basename workflow
            destination = File.join alfred_workflows_root, name
            remove_file destination
            directory File.join("workflows", name), destination
          end

          say_status :info, "Alfred Workflows installed.", :green
        else
          say_status :info, "Alfred Workflows installation cancelled.", :green
        end
      else
        say_status :error, "Invalid Alfred settings directory: #{alfred_settings_root}", :red
      end

      say
    end

    desc "-c, [--config]", "Manage gem configuration."
    map %w[-c --config] => :config
    method_option :edit,
                  aliases: "-e",
                  desc: "Edit gem configuration.",
                  type: :boolean,
                  default: false
    method_option :info,
                  aliases: "-i",
                  desc: "Print gem configuration.",
                  type: :boolean,
                  default: false
    def config
      path = self.class.configuration.path

      if options.edit? then `#{ENV["EDITOR"]} #{path}`
      elsif options.info?
        path ? say(path) : say("Configuration doesn't exist.")
      else help :config
      end
    end

    desc "-v, [--version]", "Show gem version."
    map %w[-v --version] => :version
    def version
      say Identity.version_label
    end

    desc "-h, [--help=COMMAND]", "Show this message or get help for a command."
    map %w[-h --help] => :help
    def help task = nil
      say and super
    end
  end
  # rubocop:enable Metrics/ClassLength
end
