require 'sinatra/base'

ENV['RACK_ENV'] ||= 'development'

class Chitter < Sinatra::Base

  get '/' do
    "Hello world"
  end

end
