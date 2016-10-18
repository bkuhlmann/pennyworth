# frozen_string_literal: true

$LOAD_PATH.push File.expand_path("../lib", __FILE__)
require "pennyworth/identity"

Gem::Specification.new do |spec|
  spec.name                  = Pennyworth::Identity.name
  spec.version               = Pennyworth::Identity.version
  spec.platform              = Gem::Platform::RUBY
  spec.authors               = ["Brooke Kuhlmann"]
  spec.email                 = ["brooke@alchemists.io"]
  spec.homepage              = "https://github.com/bkuhlmann/pennyworth"
  spec.summary               = "A command line interface that enhances and extends Alfred with Ruby support."
  spec.description           = "A command line interface that enhances and extends Alfred with Ruby support."
  spec.license               = "MIT"

  if File.exist?(Gem.default_key_path) && File.exist?(Gem.default_cert_path)
    spec.signing_key = Gem.default_key_path
    spec.cert_chain = [Gem.default_cert_path]
  end

  spec.required_ruby_version = "~> 2.3"
  spec.add_dependency "thor", "~> 0.19"
  spec.add_dependency "thor_plus", "~> 3.1"
  spec.add_dependency "refinements", "~> 2.2"
  spec.add_development_dependency "rake", "~> 11.0"
  spec.add_development_dependency "gemsmith", "~> 7.7"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "pry-byebug"
  spec.add_development_dependency "pry-state"
  spec.add_development_dependency "bond"
  spec.add_development_dependency "wirb"
  spec.add_development_dependency "hirb"
  spec.add_development_dependency "awesome_print"
  spec.add_development_dependency "rspec", "~> 3.5"
  spec.add_development_dependency "guard-rspec"
  spec.add_development_dependency "rubocop", "~> 0.44"
  spec.add_development_dependency "codeclimate-test-reporter"

  spec.files            = Dir["lib/**/*"]
  spec.extra_rdoc_files = Dir["README*", "LICENSE*"]
  spec.executables << "pennyworth"
  spec.require_paths = ["lib"]
end
