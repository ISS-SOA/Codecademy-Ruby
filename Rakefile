require 'rake/testtask'

task :default => [:spec]

desc 'Run specs'
task :spec do
  sh 'ruby -I lib spec/badges_spec.rb'
end
