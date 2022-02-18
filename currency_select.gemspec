# frozen_string_literal: true

version = File.read(File.expand_path('VERSION', __dir__)).strip

Gem::Specification.new do |s|
  s.name = 'currency_select'
  s.summary = 'Currency select plugin for Rails'
  s.version = version
  s.license = 'MIT'

  s.required_ruby_version = '>= 2.6.0'

  s.homepage = 'https://github.com/braingourmets/currency_select'
  s.authors = ['Trond Arve Nordheim', 'Oliver Klee']
  s.email = 'o.klee@braingourmets.com'

  s.files = %w[
    lib/currency_select.rb rails/init.rb CHANGELOG.md CODE_OF_CONDUCT.md
    currency_select.gemspec Gemfile LICENSE Rakefile README.md VERSION
  ]
  s.extra_rdoc_files = %w[CHANGELOG.md LICENSE README.md]

  s.add_runtime_dependency 'actionview', '>= 5.2.0', '< 7.1'
  s.add_runtime_dependency 'money', '~> 6.0'

  s.add_development_dependency 'rspec-rails', '~> 5.1.0'
  s.add_development_dependency 'rubocop', '~> 1.25.1'
  s.add_development_dependency 'rubocop-rails', '~> 2.13.2'
  s.add_development_dependency 'rubocop-rake', '~> 0.6.0'
  s.add_development_dependency 'rubocop-rspec', '~> 2.8.0'
end
