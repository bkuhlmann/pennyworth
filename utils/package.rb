# frozen_string_literal: true

# Overview
# This script packages Alfred support files for gem distribution. Not meant for distribution.

# Usage
# ruby package.rb

require "fileutils"
require "pathname"

# Settings
GEM_WORKFLOW_ROOT = Pathname "../lib/pennyworth/templates/workflows"
ALFRED_SETTINGS_ROOT = Pathname "/Users/bkuhlmann/Dropbox/Cache/Alfred/Alfred.alfredpreferences"
ALFRED_WORKFLOW_ROOT = ALFRED_SETTINGS_ROOT.join "workflows"

WORKFLOWS = [
  "user.workflow.C431E56A-0EC2-47EE-94D5-D67D9FE323BE",
  "user.workflow.B59B22A2-1880-4765-9358-412791BE9202"
].freeze

def package folders, source, destination
  folders.each do |folder|
    FileUtils.cp_r source.join(folder), destination
    puts "  Packaged: #{folder}"
  end
end

puts "\nCleaning gem package root..."
GEM_WORKFLOW_ROOT.rmtree
GEM_WORKFLOW_ROOT.mkdir

puts "Packaging Alfred workflows..."
package WORKFLOWS, ALFRED_WORKFLOW_ROOT, GEM_WORKFLOW_ROOT

puts "Finished!\n\n"
