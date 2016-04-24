# frozen_string_literal: true

require "yaml"
require "thor"
require "thor/actions"
require "thor_plus/actions"
require "refinements/string_extensions"

module Pennyworth
  # The Command Line Interface (CLI) for the gem.
  class CLI < Thor
    include Thor::Actions
    include ThorPlus::Actions
    using Refinements::StringExtensions

    package_name Pennyworth::Identity.version_label

    def self.source_root
      File.expand_path File.join(File.dirname(__FILE__), "templates")
    end

    def initialize args = [], options = {}, config = {}
      super args, options, config
      @settings_file = File.join ENV["HOME"], Identity.file_name
      @settings = load_yaml @settings_file
    end

    desc "-s, [--string=STRING]", "Manipulate strings."
    map %w[-s --string] => :string
    method_option :downcase, aliases: "-d", desc: "Downcase string.", type: :boolean, default: false
    method_option :upcase, aliases: "-u", desc: "Upcase string.", type: :boolean, default: false
    method_option :capitalize, aliases: "-c", desc: "Capitalize words.", type: :boolean, default: false
    method_option :size, aliases: "-s", desc: "Answer string size.", type: :boolean, default: false
    def string value
      case
        when options[:downcase] then say(value.downcase)
        when options[:upcase] then say(value.upcase)
        when options[:capitalize] then say(value.titleize)
        when options[:size] then say(value.size)
        else say("Type 'pennyworth help string' for usage.")
      end
    end

    desc "-i, [--install]", "Install Alfred Workflows."
    map %w[-i --install] => :install
    def install
      say

      if valid_file?(@settings[:alfred_settings_root], "Invalid directory for Alfred settings root")
        if yes? "Installing Alfred Workflows will destroy exiting workflows of the same name. Continue (y/n)?"
          info "Installing Alfred Workflows..."

          workflows = Dir.glob File.join(self.class.source_root, "workflows", "**")
          alfred_workflows_root = File.join @settings[:alfred_settings_root], "workflows"
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
        error "Invalid Alfred settings directory: #{@settings[:alfred_settings_root]}"
      end

      say
    end

    desc "-e, [--edit]", "Edit gem settings in default editor."
    map %w[-e --edit] => :edit
    def edit
      `#{editor} #{@settings_file}`
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
  end
end
