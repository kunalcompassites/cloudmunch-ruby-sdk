# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cloudmunch/version'

Gem::Specification.new do |spec|
  spec.name          = "cloudmunch"
  spec.version       = Cloudmunch::VERSION
  spec.authors       = ["kunal mangaraj"]
  spec.email         = ["kunal.mangaraj@compassitesinc.com"]

  spec.summary       = %q{ecause Rubygems requires one.}
  spec.description   = %q{Write a longer description or delete this line.}
  spec.homepage      = "TODO: Put your gem's website or public repo URL here."
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = Dir.glob("{lib}/**/**")
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency 'multipart-post', '>= 1.2', '< 3'
  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  # spec.add_dependency 'creek', '>= 1.0.8'
  # spec.add_runtime_dependency 'creek', '~> 1.0', '>= 1.0.8'
end
