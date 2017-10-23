require 'sinatra/base'
require_relative './models/datamapper_models'

ENV['RACK_ENV'] ||= 'development'

class Chitter < Sinatra::Base

enable :sessions

  get '/' do
    "Hello world"
    @peep_list=Peep.all#.each {|peeps| "#{peeps.user} sez #{peeps.peep_text}" }
    # "#{Peep.get(1).user} sez #{Peep.get(1).peep_text}"

    erb :index
  end

  get '/newpeep' do
    raise "Username required" if params[:username] == ""
    Peep.create(peep_text: params[:peep_text], user: params[:username], posttime: Time.now.strftime('%I:%M:%S %p'))
    redirect '/'
  end

  get '/signup' do
    erb :signup
  end

  post '/registered' do
    User.create(name: params[:name], username: params[:username], email: params[:email], password: params[:password])
    redirect '/'
  end


end
