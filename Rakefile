# frozen_string_literal: true

require 'bundler/setup'

Bundler::GemHelper.install_tasks

desc 'Runs RuboCop for checking the Ruby files.'
task :rubocop do
  sh 'rubocop gemfiles/ lib/ rails/ spec/ currency_select.gemspec Gemfile Rakefile'
end
