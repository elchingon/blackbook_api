require 'vcr'

VCR.configure do |c|
  c.cassette_library_dir = "spec/cassettes"
  c.allow_http_connections_when_no_cassette = true
  c.hook_into :webmock
  c.configure_rspec_metadata!
end

RSpec.configure do |c|
  # In rspec 3 this will no longer be nessecary
  c.treat_symbols_as_metadata_keys_with_true_values = true
  c.around do
    Dir[File.dirname(__FILE__) + "/support/blackbook_api_helper.rb"].each{|support_file| require support_file }
  end
end
