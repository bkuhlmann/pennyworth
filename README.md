# Overview

[![Gem Version](https://badge.fury.io/rb/pennyworth.png)](http://badge.fury.io/rb/pennyworth)
[![Code Climate GPA](https://codeclimate.com/github/bkuhlmann/pennyworth.png)](https://codeclimate.com/github/bkuhlmann/pennyworth)
[![Travis CI Status](https://secure.travis-ci.org/bkuhlmann/pennyworth.png)](http://travis-ci.org/bkuhlmann/pennyworth)

Enhances and extends Alfred by providing a Ruby command line interface (CLI).

# Features

* Adds Ruby support to Alfred.
* Adds the following Alfred Workflows:
    * Pennyworth String Upcase
    * Pennyworth String Length
    * Pennyworth String Downcase
    * Pennyworth String Capitalize

# Requirements

0. [OSX](http://www.apple.com/osx).
0. [Alfred](http://www.alfredapp.com) (Version 2.x.x or higher).
0. [Alfred Powerpack](http://www.alfredapp.com/purchase).
0. [rbenv](https://github.com/sstephenson/rbenv).
0. [Ruby 2.0.x](http://www.ruby-lang.org).

# Setup

Type the following from the command line to securely install (recommended):

    gem cert --add <(curl -Ls https://raw.github.com/bkuhlmann/pennyworth/master/gem-public.pem)
    gem install pennyworth -P HighSecurity

...or type the following to insecurely install (not recommended):

    gem install pennyworth

You can configure common settings for future gem builds by creating the following file:

    ~/.pennyworth/settings.yml

...using the following settings (for example):

     ---
     :alfred_settings_root: "/Users/bkuhlmann/Dropbox/Cache/Alfred/Alfred.alfredpreferences"

# Usage

From the command line, type: pennyworth

    pennyworth -e, [edit]     # Edit gem settings in default editor (assumes $EDITOR environment variable).
    pennyworth -h, [help]     # Show this message.
    pennyworth -i, [install]  # Install Alfred Workflows.
    pennyworth -s, [string]   # Manipulate strings.
    pennyworth -v, [version]  # Show version.

For string options, type: pennyworth help string

    -d, [--downcase=one two three]    # Downcase a string.
    -u, [--upcase=one two three]      # Upcase a string.
    -c, [--capitalize=one two three]  # Capitalize words in a string.
    -l, [--length=one two three]      # Answer the length of a string.

While the command line options are nice, the real power comes from running the following command:

    pennyworth -i

...which installs the Alfred Workflows to support this gem. You can use the Alfred commands
provided by each workflow instead of the CLI. Check each workflows documentation for details by
opening Alfred preferences and clicking on the _Workflows_ tab. Each workflow associated with this
gem is prefixed with _Pennyworth_.

# Tests

To test, do the following:

0. cd to the gem root.
0. bundle install
0. bundle exec rspec spec

# Versioning

Read [Semantic Versioning](http://semver.org) for details. Briefly, it means:

* Patch (x.y.Z) - Incremented for small, backwards compatible bug fixes.
* Minor (x.Y.z) - Incremented for new, backwards compatible public API enhancements and/or bug fixes.
* Major (X.y.z) - Incremented for any backwards incompatible public API changes.

# Contributions

Read CONTRIBUTING for details.

# Credits

Developed by [Brooke Kuhlmann](http://www.redalchemist.com) at [Red Alchemist](http://www.redalchemist.com)

# License

Copyright (c) 2012 [Red Alchemist](http://www.redalchemist.com).
Read the LICENSE for details.

# History

Read the CHANGELOG for details.
Built with [Gemsmith](https://github.com/bkuhlmann/gemsmith).