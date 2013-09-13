# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'belfort/version'

Gem::Specification.new do |spec|
  spec.name          = "belfort"
  spec.version       = Belfort::VERSION
  spec.authors       = ["Sam Stelfox"]
  spec.email         = ["sam+rg@stelfox.net"]
  spec.description   = %q{A ruby implmentation of the belfort board game.}
  spec.summary       = %q{A ruby implmentation of the belfort board game.}
  spec.homepage      = "https://github.com/sstelfox/belfort"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "yard"
end
