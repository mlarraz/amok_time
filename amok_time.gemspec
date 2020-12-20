# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'amok_time/version'

Gem::Specification.new do |spec|
  spec.name          = "amok_time"
  spec.version       = AmokTime::VERSION
  spec.authors       = ["Matt Larraz"]
  spec.email         = ['mlarraz@users.noreply.github.com']

  spec.summary       = %q{Utility for mocking time across service boundaries on a per-request basis}
  spec.description   = %q{Amok Time is designed for end-to-end testing distributed systems where certain behavior is time-based.
It works by allowing any client to send a request header that overrides Ruby's date and time}
  spec.homepage      = "https://github.com/mlarraz/amok_time"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.2"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "pry-byebug"
  spec.add_development_dependency "coveralls"
end
