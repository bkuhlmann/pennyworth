# frozen_string_literal: true

require_relative "lib/pennyworth/identity"

Gem::Specification.new do |spec|
  spec.name = Pennyworth::Identity::NAME
  spec.version = Pennyworth::Identity::VERSION
  spec.platform = Gem::Platform::RUBY
  spec.authors = ["Brooke Kuhlmann"]
  spec.email = ["brooke@alchemists.io"]
  spec.homepage = "https://www.alchemists.io/projects/pennyworth"
  spec.summary = Pennyworth::Identity::SUMMARY
  spec.license = "Hippocratic-3.0"

  spec.metadata = {
    "bug_tracker_uri" => "https://github.com/bkuhlmann/pennyworth/issues",
    "changelog_uri" => "https://www.alchemists.io/projects/pennyworth/changes.html",
    "documentation_uri" => "https://www.alchemists.io/projects/pennyworth",
    "rubygems_mfa_required" => "true",
    "source_code_uri" => "https://github.com/bkuhlmann/pennyworth"
  }

  spec.signing_key = Gem.default_key_path
  spec.cert_chain = [Gem.default_cert_path]

  spec.required_ruby_version = "~> 3.1"
  spec.add_dependency "dry-container", "~> 0.8"
  spec.add_dependency "http", "~> 5.0"
  spec.add_dependency "pastel", "~> 0.8"
  spec.add_dependency "rack", "~> 2.2"
  spec.add_dependency "refinements", "~> 9.0"
  spec.add_dependency "runcom", "~> 7.0"
  spec.add_dependency "zeitwerk", "~> 2.5"

  spec.bindir = "exe"
  spec.executables << "pennyworth"
  spec.extra_rdoc_files = Dir["README*", "LICENSE*"]
  spec.files            = Dir["lib/**/*"]
  spec.require_paths = ["lib"]
end
