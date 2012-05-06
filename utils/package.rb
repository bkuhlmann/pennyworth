# Overview
# This script packages Alfred support files for gem distribution. Not meant for distribution.

# Usage
# ruby package.rb

# Dependencies
require "fileutils"

# Settings
GEM_PACKAGE_ROOT = File.join(File.dirname(__FILE__), "..", "lib", "pennyworth", "templates", "alfred")
ALFRED_SETTINGS_ROOT = "/Users/brooke/Dropbox/Cache/Alfred"
ALFRED_EXTENSIONS_ROOT = "#{ALFRED_SETTINGS_ROOT}/extensions"

EXTENSION_SCRIPTS = %w(
  apple_say
  cache_flush
  edit_bash_file
  edit_file
  edit_home_file
  osx_serial
  mem_purge
  open_url_in_chrome
  open_url_in_opera
  open_url_in_safari
  restart_rails
  string_capitalize
  string_downcase
  string_length
  string_upcase
)
EXTENSION_FILES = %w(launch_browsers)

# Helper Methods
def package_folders folders, source, destination
  folders.each do |folder|
    FileUtils.cp_r File.join(source, folder), destination
    puts "  Packaged: #{folder}"
  end
end

# Execution
puts "\nCleaning gem package root..."
FileUtils.rm_r GEM_PACKAGE_ROOT
FileUtils.mkdir_p File.join(GEM_PACKAGE_ROOT, "extensions", "scripts")
FileUtils.mkdir_p File.join(GEM_PACKAGE_ROOT, "extensions", "files")

puts "Packaging Alfred extension files..."
package_folders EXTENSION_FILES, File.join(ALFRED_EXTENSIONS_ROOT, "files"), File.join(GEM_PACKAGE_ROOT, "extensions", "files")

puts "Packaging Alfred extension scripts..."
package_folders EXTENSION_SCRIPTS, File.join(ALFRED_EXTENSIONS_ROOT, "scripts"), File.join(GEM_PACKAGE_ROOT, "extensions", "scripts")

puts "Finished!\n\n"
