# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'OpenWeather/version'

Gem::Specification.new do |spec|
  spec.name          = "OpenWeather"
  spec.version       = OpenWeather::VERSION
  spec.authors       = ["Chris911"]
  spec.email         = ["Christophe.naud.dulude@gmail.com"]
  spec.description   = "Ruby wrapper for Open Weather Map - http://openweathermap.org/"
  spec.summary       = "Ruby wrapper for Open Weather Map - http://openweathermap.org/"
  spec.homepage      = "https://github.com/Chris911/OpenWeather"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"

  spec.add_runtime_dependency "httparty"
end
