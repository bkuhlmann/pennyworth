<p align="center">
  <img src="pennyworth.png" alt="Pennyworth Icon"/>
</p>

# Pennyworth

[![Gem Version](https://badge.fury.io/rb/pennyworth.svg)](http://badge.fury.io/rb/pennyworth)
[![Code Climate Maintainability](https://api.codeclimate.com/v1/badges/c1c06f6b521bfd816bc2/maintainability)](https://codeclimate.com/github/bkuhlmann/pennyworth/maintainability)
[![Code Climate Test Coverage](https://api.codeclimate.com/v1/badges/c1c06f6b521bfd816bc2/test_coverage)](https://codeclimate.com/github/bkuhlmann/pennyworth/test_coverage)
[![Circle CI Status](https://circleci.com/gh/bkuhlmann/pennyworth.svg?style=svg)](https://circleci.com/gh/bkuhlmann/pennyworth)

A command line interface that enhances Alfred with Ruby support.

<!-- Tocer[start]: Auto-generated, don't remove. -->

## Table of Contents

  - [Features](#features)
  - [Requirements](#requirements)
  - [Setup](#setup)
  - [Usage](#usage)
    - [Command Line Interface (CLI)](#command-line-interface-cli)
    - [Customization](#customization)
  - [Tests](#tests)
  - [Versioning](#versioning)
  - [Code of Conduct](#code-of-conduct)
  - [Contributions](#contributions)
  - [License](#license)
  - [History](#history)
  - [Credits](#credits)

<!-- Tocer[finish]: Auto-generated, don't remove. -->

## Features

- Adds Ruby support to Alfred.
- Adds Alfred Workflow:

![Alfred Workflow](doc/alfred_workflow.png)

## Requirements

1. [macOS](https://www.apple.com/macos).
1. [Alfred](https://www.alfredapp.com) (Version 2.x.x or higher).
1. [Alfred Powerpack](https://www.alfredapp.com/purchase).
1. [chruby](https://github.com/postmodern/chruby).
1. [Ruby 2.6.x](https://www.ruby-lang.org).

## Setup

Type the following to install:

    gem install pennyworth

## Usage

### Command Line Interface (CLI)

From the command line, type: pennyworth

    pennyworth -c, [--config]        # Manage gem configuration.
    pennyworth -h, [--help=COMMAND]  # Show this message or get help for a command.
    pennyworth -i, [--install]       # Install Alfred Workflows.
    pennyworth -s, [--string=VALUE]  # Manipulate strings.
    pennyworth -v, [--version]       # Show gem version.

For string options, type: pennyworth help string

    -d, [--downcase], [--no-downcase]    # Downcase string.
    -u, [--upcase], [--no-upcase]        # Upcase string.
    -t, [--titleize], [--no-titleize]    # Capitalize each word and delimit with space or forward slash.
    -c, [--camelcase], [--no-camelcase]  # Capitalize each word and delimit with nothing or double colon.
    -s, [--snakecase], [--no-snakecase]  # Downcase each word and delimit with underscore or forward slash.
    -s, [--size], [--no-size]            # Calculate string size.

While the command line options are nice, the real power comes from running the following command:

    pennyworth -i

...which installs the Alfred Workflows to support this gem. You can use the Alfred commands
provided by each workflow instead of the CLI. Check each workflows documentation for details by
opening Alfred preferences and clicking on the _Workflows_ tab. Each workflow associated with this
gem is prefixed with _Pennyworth_.

### Customization

This gem can be configured via a global configuration:

    ~/.config/pennyworth/configuration.yml

It can also be configured via [XDG](https://github.com/bkuhlmann/xdg) environment variables.

The default configuration is as follows:

     :alfred_settings_root: "/Users/bkuhlmann/Dropbox/Cache/Alfred/Alfred.alfredpreferences"

Feel free to take this default configuration, modify, and save as your own custom
`configuration.yml`.

## Tests

To test, run:

    bundle exec rake

## Versioning

Read [Semantic Versioning](https://semver.org) for details. Briefly, it means:

- Major (X.y.z) - Incremented for any backwards incompatible public API changes.
- Minor (x.Y.z) - Incremented for new, backwards compatible, public API enhancements/fixes.
- Patch (x.y.Z) - Incremented for small, backwards compatible, bug fixes.

## Code of Conduct

Please note that this project is released with a [CODE OF CONDUCT](CODE_OF_CONDUCT.md). By
participating in this project you agree to abide by its terms.

## Contributions

Read [CONTRIBUTING](CONTRIBUTING.md) for details.

## License

Copyright 2012 [Alchemists](https://www.alchemists.io).
Read [LICENSE](LICENSE.md) for details.

## History

Read [CHANGES](CHANGES.md) for details.
Built with [Gemsmith](https://github.com/bkuhlmann/gemsmith).

## Credits

Developed by [Brooke Kuhlmann](https://www.alchemists.io) at [Alchemists](https://www.alchemists.io)
