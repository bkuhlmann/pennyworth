# frozen_string_literal: true

require "yaml"
require "thor"
require "thor/actions"
require "thor_plus/actions"

module Pennyworth
  # The Command Line Interface (CLI) for the gem.
  class CLI < Thor
    include Thor::Actions
    include ThorPlus::Actions

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
    map %w(-s --string) => :string
    method_option :downcase, aliases: "-d", desc: "Downcase a string.", type: :array
    method_option :upcase, aliases: "-u", desc: "Upcase a string.", type: :array
    method_option :capitalize, aliases: "-c", desc: "Capitalize words in a string.", type: :array
    method_option :length, aliases: "-l", desc: "Answer the length of a string.", type: :array
    def string
      if options[:downcase]
        Pennyworth::Kits::String.downcase options[:downcase]
      elsif options[:upcase]
        Pennyworth::Kits::String.upcase options[:upcase]
      elsif options[:capitalize]
        Pennyworth::Kits::String.capitalize options[:capitalize]
      elsif options[:length]
        Pennyworth::Kits::String.length options[:length]
      else say("Type 'pennyworth help string' for usage.")
      end
    end

    desc "-i, [--install]", "Install Alfred Workflows."
    map %w(-i --install) => :install
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
    map %w(-e --edit) => :edit
    def edit
      `#{editor} #{@settings_file}`
    end

    desc "-v, [--version]", "Show gem version."
    map %w(-v --version) => :version
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
