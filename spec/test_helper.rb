
ENV['RUBY_ENV'] = 'test'

require 'minitest/autorun'

specs = File.expand_path(File.join(File.dirname(__FILE__), '**', '*_spec.rb'))
Dir.glob(specs).each { |f| require f }

