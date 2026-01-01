# frozen_string_literal: true

Gem::Specification.new do |spec|
  spec.name = "pennyworth"
  spec.version = "19.0.0"
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

  spec.required_ruby_version = ">= 4.0"
  spec.add_dependency "cogger", "~> 2.0"
  spec.add_dependency "containable", "~> 2.0"
  spec.add_dependency "core", "~> 3.0"
  spec.add_dependency "etcher", "~> 4.0"
  spec.add_dependency "ghub", "~> 1.0"
  spec.add_dependency "http", "~> 5.3"
  spec.add_dependency "infusible", "~> 5.0"
  spec.add_dependency "ox", "~> 2.14"
  spec.add_dependency "rack", "~> 3.1"
  spec.add_dependency "refinements", "~> 14.0"
  spec.add_dependency "runcom", "~> 13.0"
  spec.add_dependency "sod", "~> 2.0"
  spec.add_dependency "spek", "~> 5.0"
  spec.add_dependency "zeitwerk", "~> 2.7"

  spec.bindir = "exe"
  spec.executables << "pennyworth"
  spec.extra_rdoc_files = Dir["README*", "LICENSE*"]
  spec.files = Dir["*.gemspec", "lib/**/*"]
end
