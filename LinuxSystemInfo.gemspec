# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'LinuxSystemInfo/version'

Gem::Specification.new do |spec|
  spec.name          = 'LinuxSystemInfo'
  spec.version       = LinuxSystemInfo::VERSION
  spec.authors       = ['Saimon Lovell']
  spec.email         = ['staysynchronize@gmail.com']
  spec.summary       = %q{Get local linux hardware information.}
  spec.description   = %q{This gem gives information about RAM, CPU, HARD Drives and more. Works only on Linux OS.}
  spec.homepage      = 'https://github.com/SaimonL/linux-system-info'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'json'

  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'json'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'pry'
end
