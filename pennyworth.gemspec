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

  unless ENV["TRAVIS"]
    s.signing_key = File.expand_path("~/.ssh/gem-private.pem")
    s.cert_chain  = ["gem-public.pem"]
  end

	s.required_ruby_version = "~> 2.0.0"
	s.add_dependency "thor", "~> 0.18"
	s.add_dependency "thor_plus", "~> 1.0"
	s.add_development_dependency "rake"
  s.add_development_dependency "pry"
  s.add_development_dependency "pry-byebug"
  s.add_development_dependency "pry-rescue"
  s.add_development_dependency "pry-stack_explorer"
  s.add_development_dependency "pry-vterm_aliases"
  s.add_development_dependency "rspec"
  s.add_development_dependency "rb-fsevent" # Guard file events for OSX.
  s.add_development_dependency "rb-inotify" # Guard file events for Linux.
  s.add_development_dependency "guard-rspec"

  s.files            = Dir["lib/**/*"]
  s.extra_rdoc_files = Dir["README*", "LICENSE*"]
  s.executables      << "pennyworth"
  s.require_paths    = ["lib"]
end
