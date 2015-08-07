# Pennyworth

[![Gem Version](https://badge.fury.io/rb/pennyworth.svg)](http://badge.fury.io/rb/pennyworth)
[![Code Climate GPA](https://codeclimate.com/github/bkuhlmann/pennyworth.svg)](https://codeclimate.com/github/bkuhlmann/pennyworth)
[![Code Climate Coverage](https://codeclimate.com/github/bkuhlmann/pennyworth/coverage.svg)](https://codeclimate.com/github/bkuhlmann/pennyworth)
[![Gemnasium Status](https://gemnasium.com/bkuhlmann/pennyworth.svg)](https://gemnasium.com/bkuhlmann/pennyworth)
[![Travis CI Status](https://secure.travis-ci.org/bkuhlmann/pennyworth.png)](http://travis-ci.org/bkuhlmann/pennyworth)
[![Gittip](http://img.shields.io/gittip/bkuhlmann.svg)](https://www.gittip.com/bkuhlmann)

Enhances and extends Alfred by providing a Ruby command line interface (CLI).

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
# Table of Contents

- [Features](#features)
- [Requirements](#requirements)
- [Setup](#setup)
- [Usage](#usage)
- [Tests](#tests)
- [Versioning](#versioning)
- [Code of Conduct](#code-of-conduct)
- [Contributions](#contributions)
- [License](#license)
- [History](#history)
- [Credits](#credits)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

# Features

- Adds Ruby support to Alfred.
- Adds the following Alfred Workflows:
    - Pennyworth String Upcase
    - Pennyworth String Length
    - Pennyworth String Downcase
    - Pennyworth String Capitalize
    - Ruby on Rails Kit

# Requirements

0. [OSX](http://www.apple.com/osx).
0. [Alfred](http://www.alfredapp.com) (Version 2.x.x or higher).
0. [Alfred Powerpack](http://www.alfredapp.com/purchase).
0. [rbenv](https://github.com/sstephenson/rbenv).
0. [MRI 2.x.x](http://www.ruby-lang.org).

# Setup

For a secure install, type the following from the command line (recommended):

    gem cert --add <(curl -Ls https://www.alchemists.io/gem-public.pem)
    gem install pennyworth --trust-policy MediumSecurity

NOTE: A HighSecurity trust policy would be best but MediumSecurity enables signed gem verification while
allowing the installation of unsigned dependencies since they are beyond the scope of this gem.

For an insecure install, type the following (not recommended):

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

To test, run:

    bundle exec rspec spec

# Versioning

Read [Semantic Versioning](http://semver.org) for details. Briefly, it means:

- Patch (x.y.Z) - Incremented for small, backwards compatible bug fixes.
- Minor (x.Y.z) - Incremented for new, backwards compatible public API enhancements and/or bug fixes.
- Major (X.y.z) - Incremented for any backwards incompatible public API changes.

# Code of Conduct

Please note that this project is released with a [CODE OF CONDUCT](CODE_OF_CONDUCT.md). By participating in this project
you agree to abide by its terms.

# Contributions

Read [CONTRIBUTING](CONTRIBUTING.md) for details.

# License

Copyright (c) 2012 [Alchemists](https://www.alchemists.io).
Read the [LICENSE](LICENSE.md) for details.

# History

Read the [CHANGELOG](CHANGELOG.md) for details.
Built with [Gemsmith](https://github.com/bkuhlmann/gemsmith).

# Credits

Developed by [Brooke Kuhlmann](https://www.alchemists.io) at [Alchemists](https://www.alchemists.io)
