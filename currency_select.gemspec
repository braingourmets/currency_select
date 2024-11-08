# frozen_string_literal: true

version = File.read(File.expand_path('VERSION', __dir__)).strip

Gem::Specification.new do |s|
  s.name = 'currency_select'
  s.summary = 'Currency select plugin for Rails'
  s.version = version
  s.license = 'MIT'

  s.required_ruby_version = '>= 3.1.0'

  s.homepage = 'https://github.com/braingourmets/currency_select'
  s.authors = ['Trond Arve Nordheim', 'Oliver Klee']
  s.email = 'o.klee@braingourmets.com'

  s.files = %w[
    CHANGELOG.md CODE_OF_CONDUCT.md Gemfile LICENSE README.md Rakefile VERSION
    currency_select.gemspec
    lib/currency_select.rb lib/currency_select_tag.rb lib/form_builder.rb
    lib/form_options_helper.rb lib/to_currency_select_tag.rb
    rails/init.rb
  ]
  s.extra_rdoc_files = %w[CHANGELOG.md LICENSE README.md]

  s.add_dependency 'actionview', '>= 7.0.0', '< 8.1'
  s.add_dependency 'money', '~> 6.0'

  s.add_development_dependency 'rspec-rails', '~> 6.1.3'
  s.add_development_dependency 'rubocop', '~> 1.68.0'
  s.add_development_dependency 'rubocop-rails', '~> 2.27.0'
  s.add_development_dependency 'rubocop-rake', '~> 0.6.0'
  s.add_development_dependency 'rubocop-rspec', '~> 3.2.0'
  s.add_development_dependency 'rubocop-rspec_rails', '~> 2.30.0'
end
