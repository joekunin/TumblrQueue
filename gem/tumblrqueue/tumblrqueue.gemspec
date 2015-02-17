# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'tumblrqueue/version'

Gem::Specification.new do |spec|
  spec.name          = "tumblrqueue"
  spec.version       = Tumblrqueue::VERSION
  spec.authors       = ["Joseph Kunin"]
  spec.email         = ["joekunin@gmail.com"]
  spec.summary       = %q{A simple gem that uploads a folder of images to your Tumblr queue}
  spec.description   = %q{}
  spec.homepage      = "http://www.joekunin.com"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_runtime_dependency "xmp", "~> 0.2.0"
  spec.add_runtime_dependency "exifr", "~> 1.2.0"
  spec.add_runtime_dependency "tumblr_client", "~> 0.8.5"
end
