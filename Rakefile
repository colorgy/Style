require "bundler/gem_tasks"
require "rspec/core/rake_task"

RSpec::Core::RakeTask.new(:spec)

task :default => :spec

task :deploy do
  puts "Deploying to GitHub"
  system "bundle exec middleman deploy"
end
