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

WORKFLOWS = []
WORKFLOWS << "user.workflow.514AB72A-0A69-422D-AA58-52A35800F78E" # String Upcase
WORKFLOWS << "user.workflow.97DA8B58-F8B9-408F-B212-8F02A31DAE6B" # String Length
WORKFLOWS << "user.workflow.43F0ADF3-BF5B-4C09-BC20-DF0CA14E58A0" # String Downcase
WORKFLOWS << "user.workflow.9AFFD627-1541-4369-9034-1E0C6CC2B543" # String Capitalize

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
