# frozen_string_literal: true

Gem::Specification.new do |spec|
  spec.name = "pennyworth"
  spec.version = "17.8.0"
  spec.authors = ["Brooke Kuhlmann"]
  spec.email = ["brooke@alchemists.io"]
  spec.homepage = "https://alchemists.io/projects/pennyworth"
  spec.summary = "A command line interface for augmented Alfred workflows."
  spec.license = "Hippocratic-2.1"

  spec.metadata = {
    "bug_tracker_uri" => "https://github.com/bkuhlmann/pennyworth/issues",
    "changelog_uri" => "https://alchemists.io/projects/pennyworth/versions",
    "homepage_uri" => "https://alchemists.io/projects/pennyworth",
    "funding_uri" => "https://github.com/sponsors/bkuhlmann",
    "label" => "Pennyworth",
    "rubygems_mfa_required" => "true",
    "source_code_uri" => "https://github.com/bkuhlmann/pennyworth"
  }

  spec.signing_key = Gem.default_key_path
  spec.cert_chain = [Gem.default_cert_path]

  spec.required_ruby_version = "~> 3.4"
  spec.add_dependency "cogger", "~> 0.31"
  spec.add_dependency "containable", "~> 0.2"
  spec.add_dependency "core", "~> 1.10"
  spec.add_dependency "etcher", "~> 2.7"
  spec.add_dependency "ghub", "~> 0.21"
  spec.add_dependency "http", "~> 5.1"
  spec.add_dependency "infusible", "~> 3.12"
  spec.add_dependency "ox", "~> 2.14"
  spec.add_dependency "rack", "~> 3.0"
  spec.add_dependency "refinements", "~> 13.0"
  spec.add_dependency "runcom", "~> 11.10"
  spec.add_dependency "sod", "~> 0.20"
  spec.add_dependency "spek", "~> 3.0"
  spec.add_dependency "zeitwerk", "~> 2.7"

  spec.bindir = "exe"
  spec.executables << "pennyworth"
  spec.extra_rdoc_files = Dir["README*", "LICENSE*"]
  spec.files = Dir["*.gemspec", "lib/**/*"]
end
