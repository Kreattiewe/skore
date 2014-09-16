# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'skore/version'

Gem::Specification.new do |spec|
  spec.name          = "skore"
  spec.version       = Skore::VERSION
  spec.authors       = ["Angel Botto"]
  spec.email         = ["angelbotto@gmail.com"]
  spec.summary       = "Analize social score from users."
  spec.description   = "Analize social score from users"
  spec.homepage      = "http://kreattiewe.com/gem/skore"
  spec.post_install_message = "Thanks for instaling!!"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rspec", "~> 3.1.0"
  spec.add_development_dependency "rake"

  
end
