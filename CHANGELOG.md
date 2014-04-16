# v2.4.0

* Updated to MRI 2.1.1.
* Updated to Rubinius 2.x.x.
* Updated README with --trust-policy for secure install of gem.
* Updated RSpec helper to disable GC for all specs in order to improve performance.
* Added Rails 4.1.x support.
* Added Thor+ editor support.
* Added Gemnasium support.
* Added Coveralls support.

# v2.3.0

* Updated gemspec homepage URL to use GitHub project URL.
* Added JRuby and Rubinius VM support.

# v2.2.0

* Fixed long-form commands to use "--" prefix. Example: --example.
* Fixed Ruby Gem certificate requirements for package building.
* Fixed RSpec deprecation warnings for treating metadata symbol keys as true values.
* Removed UTF-8 encoding definitions - This is the default in Ruby 2.x.x.
* Removed .ruby-version from .gitignore.
* Removed Gemfile.lock from .gitignore.
* Updated to Ruby 2.1.0.
* Updated public gem certificate to be referenced from a central server.

# v2.1.0

* Cleaned up requirement path syntax.
* Cleaned up RSpec spec definitions so that class and instance methods are described properly using . and # notation.
* Repackaged all Alfred support workflows into a single workflow.
* Treat symbols and true values by default when running RSpec specs.
* Added .ruby-version support.
* Added pry-rescue support.
* Removed the CHANGELOG documentation from gem install.
* Updated gemspec to Thor 0.18 and higher.
* Added a Versioning section to the README.
* Converted from RDoc to Markdown documentation.
* Added public cert for secure install of gem.
* Switched from the pry-debugger to pry-byebug gem.
* Ignore the signing of a gem when building in a Travis CI environment.

# v2.0.0

* Upgraded to Ruby 2.0.0.
* Applied the Code Climate GPA badge to README.
* Switched from HTTP to HTTPS when sourcing from RubyGems.
* Added Pry development support.
* Cleaned up Guard gem dependency requirements.
* Added 'tmp' directory to .gitignore.

# v1.0.0

* Upgraded to Alfred 2.x.x.
* Removed Alfred 1.x.x extensions and added Alfred 2.x.x workflows.
* Added Guard support for testing.
* Converted/detailed the CONTRIBUTING guidelines per GitHub requirements.
* Cleaned up the README documentation.

# v0.2.0

* Cleaned up doc.
* Renamed MacOS X to OSX.
* Added the cache_flush script extension.
* Removed the directory_size script extension.
* Added parameter specifications for all extensions.
* Replaced the edit_dotfile extension with the edit_home_file extension.
* Switched to default editor for edit extensions so that TextMate isn't explicitly called.
* Fixed spec with call to pbcopy.

# v0.1.0

* Initial version.
