# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "pennyworth/version"

Gem::Specification.new do |s|
  s.name									= "pennyworth"
  s.version								= Pennyworth::VERSION
  s.platform							= Gem::Platform::RUBY
  s.author								= "Brooke Kuhlmann"
  s.email									= "brooke@redalchemist.com"
  s.homepage							= "http://www.redalchemist.com"
  s.summary								= "Enhances and extends Alfred with Ruby support."
  s.description						= "Enhances and extends Alfred with Ruby support. See the README for further details."
	s.license								= "MIT"

	s.required_ruby_version = "~> 1.9.0"
	s.add_dependency "thor", "~> 0.14"
	s.add_dependency "thor_plus", "~> 0.4"
	s.add_development_dependency "rake"
  s.add_development_dependency "pry"
  s.add_development_dependency "pry-nav"
  s.add_development_dependency "pry-stack_explorer"
  s.add_development_dependency "pry-vterm_aliases"
	s.add_development_dependency "rspec"
	s.add_development_dependency "aruba"
  s.add_development_dependency("rb-fsevent") if RUBY_PLATFORM =~ /darwin/i
  s.add_development_dependency "guard-rspec"
  
  s.files            = Dir["lib/**/*"]
  s.extra_rdoc_files = Dir["README*", "CHANGELOG*", "LICENSE*"]
  s.executables      << "pennyworth"
  s.require_paths    = ["lib"]
end
