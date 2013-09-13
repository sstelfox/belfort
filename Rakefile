
require "bundler/gem_tasks"

task :environment do
  require 'belfort'
end

desc "Run a pry session with the code loaded"
task :console => [:environment] do
  require 'pry'
  pry
end

