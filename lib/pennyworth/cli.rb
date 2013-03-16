require "yaml"
require "thor"
require "thor/actions"
require "thor_plus/actions"

module Pennyworth
  class CLI < Thor
    include Thor::Actions
    include ThorPlus::Actions

    # Overwrites the Thor template source root.
    def self.source_root
      File.expand_path File.join(File.dirname(__FILE__), "templates")
    end

    # Initialize.
    def initialize args = [], options = {}, config = {}
      super args, options, config
      @settings_file = File.join ENV["HOME"], ".pennyworth", "settings.yml"
      @settings = load_yaml @settings_file
    end

    desc "-s, [string]", "Manipulate strings."
    map "-s" => :string
    method_option :downcase, aliases: "-d", desc: "Downcase a string.", type: :array
    method_option :upcase, aliases: "-u", desc: "Upcase a string.", type: :array
    method_option :capitalize, aliases: "-c", desc: "Capitalize words in a string.", type: :array
    method_option :length, aliases: "-l", desc: "Answer the length of a string.", type: :array
    def string
      case
      when options[:downcase] then
        string = Pennyworth::Kit.array_to_string options[:downcase]
        puts Pennyworth::Kit.clip(string.downcase)
      when options[:upcase] then
        string = Pennyworth::Kit.array_to_string options[:upcase]
        puts Pennyworth::Kit.clip(string.upcase)
      when options[:capitalize] then
        words = options[:capitalize].map {|word| word.capitalize}
        words = Pennyworth::Kit.array_to_string words
        puts Pennyworth::Kit.clip(words)
      when options[:length] then
        string = Pennyworth::Kit.array_to_string options[:length]
        Pennyworth::Kit.clip(string)
        puts string.length
      else say("Type 'pennyworth help string' for usage.")
      end
    end

    desc "-i, [install]", "Install Alfred support files."
    map "-i" => :install
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

    desc "-e, [edit]", "Edit gem settings in default editor (assumes $EDITOR environment variable)."
    map "-e" => :edit
    def edit
      `$EDITOR #{@settings_file}`
    end

    desc "-v, [version]", "Show version."
    map "-v" => :version
    def version
      say "Pennyworth " + VERSION
    end
    
    desc "-h, [help]", "Show this message."
    def help task = nil
      say and super
    end
  end
end
