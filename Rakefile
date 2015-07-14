begin
  require 'rspec/core/rake_task'
  require 'cucumber/rake/task'
  Cucumber::Rake::Task.new(:cucumber) do |t|
    t.cucumber_opts = "features --format pretty"
  end
  RSpec::Core::RakeTask.new(:spec)
rescue LoadError
end

task(:default).clear
task :default => [:cucumber, :spec]
