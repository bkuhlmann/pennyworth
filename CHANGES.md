# v3.2.0 (2015-12-02)

- Fixed README URLs to use HTTPS schemes where possible.
- Fixed README test command instructions.
- Added Gemsmith development support.
- Added Identity module description.
- Added Patreon badge to README.
- Added Rubocop support.
- Added [pry-state](https://github.com/SudhagarS/pry-state) support.
- Added gem configuration file name to identity.
- Added gem label to CLI version description.
- Added package name to CLI.
- Added project name to README.
- Added table of contents to README.
- Updated --edit option to include gem name in description.
- Updated Code Climate to run when CI ENV is set.
- Updated Code of Conduct 1.3.0.
- Updated README with Tocer generated Table of Contents.
- Updated RSpec support kit with new Gemsmith changes.
- Updated to Ruby 2.2.3.
- Updated README with SVG icons.
- Removed GitTip badge from README.
- Removed unnecessary exclusions from .gitignore.

# v3.1.0 (2015-07-05)

- Removed JRuby support (no longer officially supported).
- Fixed secure gem installs (new cert has 10 year lifespan).
- Updated to Ruby 2.2.2.
- Added CLI process title support.
- Added code of conduct documentation.

# v3.0.0 (2015-01-01)

- Removed Ruby 2.0.0 support.
- Removed Rubinius support.
- Updated gemspec to use RUBY_GEM_SECURITY env var for gem certs.
- Updated to Thor+ 2.x.x.
- Added Ruby 2.2.0 support.

# v2.6.0 (2014-10-22)

- Updated to Ruby 2.1.3.
- Updated to Rubinius 2.2.10.
- Updated gemspec to add security keys unless in a CI environment.
- Updated Code Climate to run only if environment variable is present.
- Added author and email arrays to gemspec.
- Added the Ruby on Rails workflow.
- Added the Guard Terminal Notifier gem.
- Refactored RSpec configuration, support, and kit folders.

# v2.5.0 (2014-07-06)

- Added Code Climate test coverage support.
- Updated to Ruby 2.1.2.
- Updated gem-public.pem for gem install certificate chain.

# v2.4.0 (2014-04-16)

- Updated to MRI 2.1.1.
- Updated to Rubinius 2.x.x.
- Updated README with --trust-policy for secure install of gem.
- Updated RSpec helper to disable GC for all specs in order to improve performance.
- Added Rails 4.1.x support.
- Added Thor+ editor support.
- Added Gemnasium support.
- Added Coveralls support.

# v2.3.0 (2014-02-15)

- Updated gemspec homepage URL to use GitHub project URL.
- Added JRuby and Rubinius VM support.

# v2.2.0 (2013-12-28)

- Fixed long-form commands to use "--" prefix. Example: --example.
- Fixed Ruby Gem certificate requirements for package building.
- Fixed RSpec deprecation warnings for treating metadata symbol keys as true values.
- Removed UTF-8 encoding definitions - This is the default in Ruby 2.x.x.
- Removed .ruby-version from .gitignore.
- Removed Gemfile.lock from .gitignore.
- Updated to Ruby 2.1.0.
- Updated public gem certificate to be referenced from a central server.

# v2.1.0 (2013-08-13)

- Cleaned up requirement path syntax.
- Cleaned up RSpec spec definitions so that class and instance methods are described properly using . and # notation.
- Repackaged all Alfred support workflows into a single workflow.
- Treat symbols and true values by default when running RSpec specs.
- Added .ruby-version support.
- Added pry-rescue support.
- Removed the CHANGELOG documentation from gem install.
- Updated gemspec to Thor 0.18 and higher.
- Added a Versioning section to the README.
- Converted from RDoc to Markdown documentation.
- Added public cert for secure install of gem.
- Switched from the pry-debugger to pry-byebug gem.
- Ignore the signing of a gem when building in a Travis CI environment.

# v2.0.0 (2013-03-17)

- Upgraded to Ruby 2.0.0.
- Applied the Code Climate GPA badge to README.
- Switched from HTTP to HTTPS when sourcing from RubyGems.
- Added Pry development support.
- Cleaned up Guard gem dependency requirements.
- Added 'tmp' directory to .gitignore.

# v1.0.0 (2013-03-16)

- Upgraded to Alfred 2.x.x.
- Removed Alfred 1.x.x extensions and added Alfred 2.x.x workflows.
- Added Guard support for testing.
- Converted/detailed the CONTRIBUTING guidelines per GitHub requirements.
- Cleaned up the README documentation.

# v0.2.0 (2012-05-19)

- Cleaned up doc.
- Renamed MacOS X to OSX.
- Added the cache_flush script extension.
- Removed the directory_size script extension.
- Added parameter specifications for all extensions.
- Replaced the edit_dotfile extension with the edit_home_file extension.
- Switched to default editor for edit extensions so that TextMate isn't explicitly called.
- Fixed spec with call to pbcopy.

# v0.1.0 (2012-03-18)

- Initial version.