# Overview
# This script packages Alfred support files for gem distribution. Not meant for distribution.

# Usage
# ruby package.rb

# Dependencies
require "fileutils"

# Settings
GEM_WORKFLOW_ROOT = File.join(File.dirname(__FILE__), "..", "lib", "pennyworth", "templates", "workflows")
ALFRED_SETTINGS_ROOT = "/Users/bkuhlmann/Dropbox/Cache/Alfred/Alfred.alfredpreferences"
ALFRED_WORKFLOW_ROOT = "#{ALFRED_SETTINGS_ROOT}/workflows"

WORKFLOWS = ["user.workflow.C431E56A-0EC2-47EE-94D5-D67D9FE323BE"]

# Package helper method that packages Alfred source folders for distribution.
# ==== Parameters
# * +folders+ - Required. The array of folders to package.
# * +source+ - Required. The folders source path.
# * +destination+ - Required. The destination path for packaging.
def package folders, source, destination
  folders.each do |folder|
    FileUtils.cp_r File.join(source, folder), destination
    puts "  Packaged: #{folder}"
  end
end

# Execution
puts "\nCleaning gem package root..."
FileUtils.rm_r GEM_WORKFLOW_ROOT
FileUtils.mkdir_p File.join(GEM_WORKFLOW_ROOT)

puts "Packaging Alfred workflows..."
package WORKFLOWS, ALFRED_WORKFLOW_ROOT, GEM_WORKFLOW_ROOT

puts "Finished!\n\n"
