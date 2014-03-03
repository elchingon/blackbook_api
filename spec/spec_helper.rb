require 'dotenv'

Dotenv.load

require 'rspec'
require 'pry'
require 'blackbook_api'

Rspec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.around do
    Dir[File.dirname(__FILE__) + "/support/**.rb"].each{|support_file| require support_file }
  end
end
