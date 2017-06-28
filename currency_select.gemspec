# frozen_string_literal: true

version = File.read(File.expand_path('../VERSION', __FILE__)).strip

Gem::Specification.new do |s|
  s.name = 'currency_select'
  s.summary = 'Currency select plugin for Rails'
  s.version = version
  s.license = 'MIT'

  s.homepage = 'https://github.com/braingourmets/currency_select'
  s.authors = ['Trond Arve Nordheim', 'Oliver Klee']
  s.email = 'o.klee@braingourmets.com'

  s.files = %w(CHANGELOG.md currency_select.gemspec Gemfile LICENSE Rakefile README.md VERSION lib/currency_select.rb rails/init.rb spec/currency_select_spec.rb spec/spec_helper.rb)
  s.extra_rdoc_files = %w(CHANGELOG.md LICENSE README.rdoc)

  s.add_runtime_dependency 'actionview'
  s.add_runtime_dependency 'money'
  s.add_development_dependency 'rspec-rails'
end
