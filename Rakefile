# frozen_string_literal: true

require 'rdoc/task'

# RDoc setup
# ----------------------------------------------------------------------------
Rake::RDocTask.new do |rdoc|
  version = File.read('VERSION')

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "currency_select #{version}"
  rdoc.rdoc_files.include('README.md')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

desc 'Runs RuboCop for checking the Ruby files.'
task :rubocop do
  sh 'rubocop lib/ rails/ spec/ currency_select.gemspec Gemfile Rakefile'
end
