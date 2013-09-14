
require 'cover_me'
require 'belfort'

CoverMe.config do |c|
  c.at_exit = Proc.new {
    File.join(CoverMe.config.html_formatter.output_path, 'index.html')
  }
end
CoverMe.complete!

RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.run_all_when_everything_filtered = true
  config.filter_run :focus
  config.order = 'random'
end
