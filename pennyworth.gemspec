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
	s.post_install_message	= "(W): www.redalchemist.com. (T): @ralchemist."

	s.required_ruby_version = "~> 1.9.0"
	s.add_dependency "thor"
	s.add_dependency "thor_plus", "~> 0.3"
	s.add_development_dependency "rake"
	s.add_development_dependency "rspec"
	s.add_development_dependency "aruba"
  
  s.files            = Dir["lib/**/*"]
  s.extra_rdoc_files = Dir["README*", "CHANGELOG*", "LICENSE*"]
  s.executables      << "pennyworth"
  s.require_paths    = ["lib"]
end
