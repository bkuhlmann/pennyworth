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
  spec.license = "Apache-2.0"

  spec.metadata = {
    "bug_tracker_uri" => "https://github.com/bkuhlmann/pennyworth/issues",
    "changelog_uri" => "https://www.alchemists.io/projects/pennyworth/changes.html",
    "documentation_uri" => "https://www.alchemists.io/projects/pennyworth",
    "source_code_uri" => "https://github.com/bkuhlmann/pennyworth"
  }

  spec.signing_key = Gem.default_key_path
  spec.cert_chain = [Gem.default_cert_path]

  spec.required_ruby_version = "~> 3.0"
  spec.add_dependency "dry-container", "~> 0.8"
  spec.add_dependency "http", "~> 5.0"
  spec.add_dependency "pastel", "~> 0.8"
  spec.add_dependency "rack", "~> 2.2"
  spec.add_dependency "refinements", "~> 8.0"
  spec.add_dependency "runcom", "~> 7.0"
  spec.add_dependency "zeitwerk", "~> 2.4"

  spec.files            = Dir["lib/**/*"]
  spec.extra_rdoc_files = Dir["README*", "LICENSE*"]
  spec.executables << "pennyworth"
  spec.require_paths = ["lib"]
end
