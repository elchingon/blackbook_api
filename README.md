# BlackbookApi

Gem to connect to Blackbook Vehicle API service. Parses the data returned from API and stores in gem specific objects.
Docs are here: https://developer.blackbookcloud.com/Documentation

## Installation

Add this line to your application's Gemfile:

    gem 'blackbook_api'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install blackbook_api

## Usage
To Install 

    $ rails g blackbook_api:install 

Set ENV variables for Blackbook username and password so specs will run
   
    ENV['BLACKBOOK_USERNAME']
    ENV['BLACKBOOK_PASSWORD']


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

[ ![Codeship Status for elchingon/blackbook_api](https://www.codeship.io/projects/ebd5b240-efec-0131-0c85-62ba7cdbe292/status)](https://www.codeship.io/projects/27173)
