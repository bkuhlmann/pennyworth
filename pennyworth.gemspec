# frozen_string_literal: true

Gem::Specification.new do |spec|
  spec.name = "pennyworth"
  spec.version = "13.0.1"
  spec.authors = ["Brooke Kuhlmann"]
  spec.email = ["brooke@alchemists.io"]
  spec.homepage = "https://www.alchemists.io/projects/pennyworth"
  spec.summary = "A command line interface that augments Alfred workflows."
  spec.license = "Hippocratic-2.1"

  spec.metadata = {
    "bug_tracker_uri" => "https://github.com/bkuhlmann/pennyworth/issues",
    "changelog_uri" => "https://www.alchemists.io/projects/pennyworth/versions",
    "documentation_uri" => "https://www.alchemists.io/projects/pennyworth",
    "funding_uri" => "https://github.com/sponsors/bkuhlmann",
    "label" => "Pennyworth",
    "rubygems_mfa_required" => "true",
    "source_code_uri" => "https://github.com/bkuhlmann/pennyworth"
  }

  spec.signing_key = Gem.default_key_path
  spec.cert_chain = [Gem.default_cert_path]

  spec.required_ruby_version = "~> 3.1"
  spec.add_dependency "auto_injector", "~> 0.5"
  spec.add_dependency "cogger", "~> 0.0"
  spec.add_dependency "dry-container", "~> 0.9"
  spec.add_dependency "http", "~> 5.0"
  spec.add_dependency "rack", "~> 2.2"
  spec.add_dependency "refinements", "~> 9.2"
  spec.add_dependency "runcom", "~> 8.2"
  spec.add_dependency "spek", "~> 0.2"
  spec.add_dependency "zeitwerk", "~> 2.5"

  spec.bindir = "exe"
  spec.executables << "pennyworth"
  spec.extra_rdoc_files = Dir["README*", "LICENSE*"]
  spec.files = Dir["*.gemspec", "lib/**/*"]
end
