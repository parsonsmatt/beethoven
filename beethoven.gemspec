# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'beethoven/version'

Gem::Specification.new do |spec|
  spec.name          = 'beethoven'
  spec.version       = Beethoven::VERSION
  spec.authors       = ['Matt Parsons']
  spec.email         = ['parsonsmatt@gmail.com']
  spec.summary       = 'Make it a bit easier to compose classes in Ruby'
  spec.description   = <<-EOF
Functional programming is gaining more and more mindshare in software lately. One of the main benefits of programming in the functional style is function composition. Function composition allows you to break your program into small manageable chunks that can be put together in new and interesting ways.

Object Oriented Programming is supposed to be composable, but the composition is lacking compared to FP. Perhaps Ruby's flexibility can get us part of the way there?
  EOF
  spec.homepage      = 'https://www.github.com/parsonsmatt/beethoven'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.7'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'guard', '~> 2.12'
  spec.add_development_dependency 'rspec', '~> 3.3'
  spec.add_development_dependency 'guard-rspec', '~> 4.5'
  spec.add_development_dependency 'rubocop'
end
