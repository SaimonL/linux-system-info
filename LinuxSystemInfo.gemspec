# coding: utf-8

require_relative 'lib/LinuxSystemInfo/version'

Gem::Specification.new do |spec|
  spec.name          = 'LinuxSystemInfo'
  spec.version       = LinuxSystemInfo::VERSION
  spec.authors       = ['Saimon Lovell']
  spec.email         = ['staysynchronize@gmail.com']

  spec.summary       = %q{Get local linux hardware information.}
  spec.description   = %q{This gem gives information about RAM, CPU, HARD Drives and more. Works only on Linux OS.}
  spec.homepage      = 'https://github.com/SaimonL/linux-system-info'
  spec.license       = 'MIT'
  spec.required_ruby_version = '>= 3.0.0'

  spec.metadata['allowed_push_host'] = 'https://rubygems.org'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/SaimonL/linux-system-info'
  spec.metadata['changelog_uri'] = 'https://github.com/SaimonL/linux-system-info/blob/master/CHANGELOG.md'


  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end

  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'json'

  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'json'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'pry'
end
