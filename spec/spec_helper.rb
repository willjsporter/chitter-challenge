ENV['RACK_ENV'] = 'test'

require_relative '../app'
require 'data_mapper'
require 'dm-migrations'
require 'rspec'
require 'database_cleaner'
require 'capybara'
require 'capybara/rspec'
require 'launchy'
require 'simplecov'
require 'simplecov-console'
require 'sinatra/base'
require 'timecop'

Capybara.save_path = '/Users/will/Projects/MA-COURSE/week4/chitter-challenge/logs'
Capybara.app = Chitter

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  # Want a nice code coverage website? Uncomment this next line!
  # SimpleCov::Formatter::HTMLFormatter
])
SimpleCov.start

RSpec.configure do |config|

  # config.before(:suite) do
  #   DatabaseCleaner.strategy = :transaction
  #   #DatabaseCleaner.clean_with(:truncation)
  # end
  #
  config.before(:each) do
    # DatabaseCleaner.start
    Timecop.freeze(Time.now)
  end

  config.after(:each) do
    # DatabaseCleaner.clean
    Timecop.return
  end

  config.after(:suite) do
    puts
    puts "\e[33mHave you considered running rubocop? It will help you improve your code!\e[0m"
    puts "\e[33mTry it now! Just run: rubocop\e[0m"
  end
end
