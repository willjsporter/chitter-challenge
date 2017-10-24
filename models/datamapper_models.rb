require 'data_mapper'
require 'dm-migrations'
require './models/peep'
require './models/user'


heroku_url = ENV['https://chitter1234.herokuapp.com/']
local_db = "postgres://localhost/peep_#{ENV['RACK_ENV']}_database"

DataMapper.setup(:default, heroku_url || local_db)
DataMapper.finalize
DataMapper.auto_upgrade!
