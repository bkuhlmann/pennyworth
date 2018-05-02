# 7.2.0 (2018-05-01)

- Added Runcom examples for project specific usage.
- Updated project changes to use semantic versions.
- Updated to Gemsmith 12.0.0.
- Updated to Git Cop 2.2.0.
- Updated to Refinements 5.2.0.

# 7.1.0 (2018-04-01)

- Fixed gemspec issues with missing gem signing key/certificate.
- Added gemspec metadata for source, changes, and issue tracker URLs.
- Updated README license information.
- Updated gem dependencies.
- Updated to Circle CI 2.0.0 configuration.
- Updated to Refinements 5.1.0.
- Updated to Rubocop 0.53.0.
- Updated to Ruby 2.5.1.
- Updated to Runcom 3.0.0.
- Removed Circle CI Bundler cache.
- Removed Gemnasium support.
- Removed Patreon badge from README.
- Refactored temp dir shared context as a pathname.

# 7.0.0 (2018-01-01)

- Updated Code Climate badges.
- Updated Code Climate configuration to Version 2.0.0.
- Updated to Apache 2.0 license.
- Updated to Rubocop 0.52.0.
- Updated to Ruby 2.4.3.
- Updated to Ruby 2.5.0.
- Removed documentation for secure installs.
- Refactored code to use Ruby 2.5.0 `Array#append` syntax.

# 6.3.0 (2017-11-19)

- Updated Alfred workflows.
- Updated to Git Cop 1.7.0.
- Updated to Rake 12.3.0.

# 6.2.0 (2017-10-29)

- Added Bundler Audit gem.
- Updated to Rubocop 0.50.0.
- Updated to Rubocop 0.51.0.
- Updated to Ruby 2.4.2.

# 6.1.0 (2017-08-27)

- Added Git Cop code quality task.
- Added dynamic formatting of RSpec output.
- Updated CONTRIBUTING documentation.
- Updated GitHub templates.
- Updated README headers.
- Updated command line usage in CLI specs.
- Updated gem dependencies.
- Updated to Awesome Print 1.8.0.
- Updated to Gemsmith 10.0.0.
- Updated to Git Cop 1.3.0.
- Removed Pry State gem.
- Removed Thor+ gem.
- Refactored CLI version/help specs.

# 6.0.0 (2017-06-17)

- Fixed Travis CI configuration to not update gems.
- Added Circle CI support.
- Added code quality Rake task.
- Updated Guardfile to always run RSpec with documentation format.
- Updated README semantic versioning order.
- Updated README usage configuration documenation.
- Updated RSpec configuration to output documentation when running.
- Updated RSpec spec helper to enable color output.
- Updated Rubocop configuration.
- Updated Rubocop to import from global configuration.
- Updated contributing documentation.
- Updated gem dependencies.
- Updated to Ruby 2.4.1.
- Updated to Runcom 1.1.0.
- Removed Code Climate code comment checks.
- Removed Travis CI support.
- Removed `.bundle` directory from `.gitignore`.

# 5.0.0 (2017-01-22)

- Updated Rubocop Metrics/LineLength to 100 characters.
- Updated Rubocop Metrics/ParameterLists max to three.
- Updated Travis CI configuration to use latest RubyGems version.
- Updated gemspec to require Ruby 2.4.0 or higher.
- Updated to Rubocop 0.47.
- Updated to Ruby 2.4.0.
- Removed Rubocop Style/Documentation check.

# 4.1.0 (2016-12-18)

- Fixed Rakefile support for RSpec, Reek, Rubocop, and SCSS Lint.
- Added `Gemfile.lock` to `.gitignore`.
- Updated Travis CI configuration to use defaults.
- Updated to Gemsmith 8.2.x.
- Updated to Rake 12.x.x.
- Updated to Rubocop 0.46.x.
- Updated to Ruby 2.3.2.
- Updated to Ruby 2.3.3.

# 4.0.0 (2016-11-13)

- Fixed CLI command descriptions.
- Fixed OSX versus macOS terminology.
- Fixed Rakefile to safely load Gemsmith tasks.
- Fixed Rubocop Style/PercentLiteralDelimiters issues.
- Fixed Ruby pragma.
- Fixed contributing guideline links.
- Added Code Climate engine support.
- Added GitHub issue and pull request templates.
- Added IRB development console Rake task support.
- Added Reek support.
- Added Refinements support.
- Added Rubocop Style/SignalException cop style.
- Added Ruby 2.3.0 frozen string literal support to source files.
- Added Runcom support.
- Added `--string --camelcase` option.
- Added `--string --snakecase` option.
- Added bond, wirb, hirb, and awesome_print development dependencies.
- Added frozen string literal pragma.
- Updated Alfred workflows.
- Updated CLI command option documentation.
- Updated CLI to require value passed in for --string option.
- Updated GitHub issue and pull request templates.
- Updated Pennyworth Alfred workflow.
- Updated README secure gem install documentation.
- Updated README to mention "Ruby" instead of "MRI".
- Updated README versioning documentation.
- Updated RSpec temp directory to use Bundler root path.
- Updated Rubocop PercentLiteralDelimiters and AndOr styles.
- Updated `--config` command to use computed path.
- Updated gemspec with conservative versions.
- Updated to Code Climate Test Reporter 1.0.0.
- Updated to Code of Conduct, Version 1.4.0.
- Updated to Gemsmith 7.7.0.
- Updated to Gemsmith 8.1.0.
- Updated to RSpec 3.5.0.
- Updated to Refinements 3.0.0.
- Updated to Rubocop 0.44.
- Updated to Ruby 2.2.4.
- Updated to Ruby 2.3.0.
- Updated to Ruby 2.3.1.
- Updated to Thor+ 4.0.0.
- Removed --string --length option (use --size instead).
- Removed CHANGELOG.md (use CHANGES.md instead).
- Removed CLI defaults (using configuration instead).
- Removed RSpec default monkey patching behavior.
- Removed Rake console task.
- Removed Ruby 2.1.x and 2.2.x support.
- Removed `--edit` command (use `--config --edit` instead).
- Removed `--string --capitalize` option.
- Removed `settings.yml` (use `~/.pennyworthrc` instead).
- Removed clipboard aid.
- Removed gem label from CLI edit and version descriptions
- Removed gemspec description.
- Removed method documentation.
- Removed rb-fsevent development dependency from gemspec.
- Removed string kit.
- Removed terminal notifier gems from gemspec.
- Refactored Alfred configuration to use Runcom configuration.
- Refactored CLI case statement to if statement.
- Refactored CLI implementation.
- Refactored CLI to use string refinements.
- Refactored RSpec spec helper configuration.
- Refactored gemspec to use default security keys.
- Refactored source requirements.

# 3.2.0 (2015-12-02)

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

# 3.1.0 (2015-07-05)

- Removed JRuby support (no longer officially supported).
- Fixed secure gem installs (new cert has 10 year lifespan).
- Updated to Ruby 2.2.2.
- Added CLI process title support.
- Added code of conduct documentation.

# 3.0.0 (2015-01-01)

- Removed Ruby 2.0.0 support.
- Removed Rubinius support.
- Updated gemspec to use RUBY_GEM_SECURITY env var for gem certs.
- Updated to Thor+ 2.x.x.
- Added Ruby 2.2.0 support.

# 2.6.0 (2014-10-22)

- Updated to Ruby 2.1.3.
- Updated to Rubinius 2.2.10.
- Updated gemspec to add security keys unless in a CI environment.
- Updated Code Climate to run only if environment variable is present.
- Added author and email arrays to gemspec.
- Added the Ruby on Rails workflow.
- Added the Guard Terminal Notifier gem.
- Refactored RSpec configuration, support, and kit folders.

# 2.5.0 (2014-07-06)

- Added Code Climate test coverage support.
- Updated to Ruby 2.1.2.
- Updated gem-public.pem for gem install certificate chain.

# 2.4.0 (2014-04-16)

- Updated to MRI 2.1.1.
- Updated to Rubinius 2.x.x.
- Updated README with --trust-policy for secure install of gem.
- Updated RSpec helper to disable GC for all specs in order to improve performance.
- Added Rails 4.1.x support.
- Added Thor+ editor support.
- Added Gemnasium support.
- Added Coveralls support.

# 2.3.0 (2014-02-15)

- Updated gemspec homepage URL to use GitHub project URL.
- Added JRuby and Rubinius VM support.

# 2.2.0 (2013-12-28)

- Fixed long-form commands to use "--" prefix. Example: --example.
- Fixed Ruby Gem certificate requirements for package building.
- Fixed RSpec deprecation warnings for treating metadata symbol keys as true values.
- Removed UTF-8 encoding definitions - This is the default in Ruby 2.x.x.
- Removed .ruby-version from .gitignore.
- Removed Gemfile.lock from .gitignore.
- Updated to Ruby 2.1.0.
- Updated public gem certificate to be referenced from a central server.

# 2.1.0 (2013-08-13)

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

# 2.0.0 (2013-03-17)

- Upgraded to Ruby 2.0.0.
- Applied the Code Climate GPA badge to README.
- Switched from HTTP to HTTPS when sourcing from RubyGems.
- Added Pry development support.
- Cleaned up Guard gem dependency requirements.
- Added 'tmp' directory to .gitignore.

# 1.0.0 (2013-03-16)

- Upgraded to Alfred 2.x.x.
- Removed Alfred 1.x.x extensions and added Alfred 2.x.x workflows.
- Added Guard support for testing.
- Converted/detailed the CONTRIBUTING guidelines per GitHub requirements.
- Cleaned up the README documentation.

# 0.2.0 (2012-05-19)

- Cleaned up doc.
- Renamed MacOS X to OSX.
- Added the cache_flush script extension.
- Removed the directory_size script extension.
- Added parameter specifications for all extensions.
- Replaced the edit_dotfile extension with the edit_home_file extension.
- Switched to default editor for edit extensions so that TextMate isn't explicitly called.
- Fixed spec with call to pbcopy.

# 0.1.0 (2012-03-18)

- Initial version.
