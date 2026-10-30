# frozen_string_literal: true

Gem::Specification.new do |s|
  s.name = 'currency_select'
  s.summary = 'Currency select plugin for Rails'
  s.version = '10.0.0'
  s.license = 'MIT'

  s.required_ruby_version = '>= 3.3.0'

  s.homepage = 'https://github.com/braingourmets/currency_select'
  s.authors = ['Trond Arve Nordheim', 'Oliver Klee']
  s.email = 'o.klee@braingourmets.com'

  s.metadata = {
    'bug_tracker_uri' => 'https://github.com/braingourmets/currency_select/issues',
    'changelog_uri' => 'https://github.com/braingourmets/currency_select/blob/master/CHANGELOG.md',
    'documentation_uri' => 'https://www.rubydoc.info/gems/currency_select',
    'homepage_uri' => s.homepage,
    'source_code_uri' => 'https://github.com/braingourmets/currency_select'
  }

  s.files = %w[
    CHANGELOG.md
    Gemfile
    LICENSE
    README.md
    Rakefile
    currency_select.gemspec
    lib/currency_select.rb
    lib/currency_select_tag.rb
    lib/form_builder.rb
    lib/form_options_helper.rb
    lib/to_currency_select_tag.rb
    rails/init.rb
  ]
  s.extra_rdoc_files = %w[CHANGELOG.md LICENSE README.md]

  s.add_dependency 'actionview', '>= 8.0.0', '< 8.2'
  s.add_dependency 'money', '~> 6.19.0'

  s.add_development_dependency 'rspec-rails', '~> 8.0.4'
  s.add_development_dependency 'rubocop', '~> 1.90.0'
  s.add_development_dependency 'rubocop-rails', '~> 2.37.0'
  s.add_development_dependency 'rubocop-rake', '~> 0.7.1'
  s.add_development_dependency 'rubocop-rspec', '~> 3.10.2'
  s.add_development_dependency 'rubocop-rspec_rails', '~> 2.32.0'
end
