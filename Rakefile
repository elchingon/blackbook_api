require "bundler/gem_tasks"
require "rspec/core/rake_task"

desc "Default: Run specs."
task :default => "spec:unit"

namespace :spec do
  desc "Run unit specs"
  RSpec::Core::RakeTask.new('unit') do |t|
    t.pattern = "spec/blackbook_api/**/*_spec.rb"
  end
end

desc "Open an irb session preloaded with this library"
task :console do
  sh "irb -rubygems -I lib -r blackbook_api.rb"
end
