
require "bundler/gem_tasks"

task :environment do
  require 'belfort'
end

desc "Run all the tests"
task :test => [:environment] do
  require './spec/test_helper'
end

