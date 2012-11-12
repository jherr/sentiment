# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'simple_sentiment/version'

Gem::Specification.new do |gem|
  gem.name          = "simple_sentiment"
  gem.version       = SimpleSentiment::VERSION
  gem.authors       = ["Jack Herrington"]
  gem.email         = ["jherr@pobox.com"]
  gem.description   = %q{An NLP sentiment detection library}
  gem.summary       = %q{This gem does simple word detection based on a built-in library to come up with a positive/negative sentiment score for a given string. English only. Doesn't require a web service.}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_development_dependency "rspec", "~> 2.6"
end
