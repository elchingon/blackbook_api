require 'dotenv'

Dotenv.load

require 'rspec'
require 'pry'
require 'blackbook_api'

Dir[File.dirname(__FILE__) + "/support/**.rb"].each{|support_file| require support_file }
