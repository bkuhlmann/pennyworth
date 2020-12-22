# frozen_string_literal: true

require_relative "lib/pennyworth/identity"

Gem::Specification.new do |spec|
  spec.name = Pennyworth::Identity::NAME
  spec.version = Pennyworth::Identity::VERSION
  spec.platform = Gem::Platform::RUBY
  spec.authors = ["Brooke Kuhlmann"]
  spec.email = ["brooke@alchemists.io"]
  spec.homepage = "https://www.alchemists.io/projects/pennyworth"
  spec.summary = "A command line interface that enhances Alfred with Ruby support."
  spec.license = "Apache-2.0"

  spec.metadata = {
    "bug_tracker_uri" => "https://github.com/bkuhlmann/pennyworth/issues",
    "changelog_uri" => "https://www.alchemists.io/projects/pennyworth/changes.html",
    "documentation_uri" => "https://www.alchemists.io/projects/pennyworth",
    "source_code_uri" => "https://github.com/bkuhlmann/pennyworth"
  }

  spec.signing_key = Gem.default_key_path
  spec.cert_chain = [Gem.default_cert_path]

  spec.required_ruby_version = "~> 2.7"
  spec.add_dependency "refinements", "~> 7.18"
  spec.add_dependency "runcom", "~> 6.4"
  spec.add_dependency "thor", "~> 0.20"

  spec.files            = Dir["lib/**/*"]
  spec.extra_rdoc_files = Dir["README*", "LICENSE*"]
  spec.executables << "pennyworth"
  spec.require_paths = ["lib"]
end
