# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "guard/evax/version"

Gem::Specification.new do |s|
  s.name        = "guard-evax"
  s.version     = Guard::EvaxVersion::VERSION
  s.authors     = ["Krzysztof Jablonski"]
  s.email       = ["jablko@gmail.com"]
  s.homepage    = "http://jablko3.com"
  s.summary     = %q{Guard gem for Evax}
  s.description = %q{Guard::Evax automatically runs the Evax gem when needed}

  s.rubyforge_project = "guard-evax"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency 'guard', '>= 0.2.2'

  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  # s.add_runtime_dependency "rest-client"
end
