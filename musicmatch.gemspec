# frozen_string_literal: true

require_relative 'lib/musicmatch/version'

Gem::Specification.new do |spec|
  spec.name          = 'musicmatch'
  spec.version       = Musicmatch::VERSION
  spec.authors       = ['Hondallica']
  spec.email         = ['hondallica@gmail.com']

  spec.summary       = 'musixmatch API client library'
  spec.homepage      = 'https://github.com/hondallica/ruby-musixmatch'
  spec.license       = 'MIT'
  spec.required_ruby_version = Gem::Requirement.new('>= 2.5.0')

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = spec.homepage

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'faraday', '~> 1.0.1'
  spec.add_dependency 'faraday_middleware', '~> 1.0.0'
  spec.add_dependency 'hashie', '~> 4.1.0'

  spec.add_development_dependency 'bundler', '~>2.1.4'
  spec.add_development_dependency 'pry', '~> 0.13.1'
  spec.add_development_dependency 'rake', '~> 13.0.1'
  spec.add_development_dependency 'rspec', '~> 3.9.0'
  spec.add_development_dependency 'rubocop', '~> 0.84.0'
  spec.add_development_dependency 'webmock', '~> 3.8.3'
end
