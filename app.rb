require 'sinatra/base'
require_relative './models/datamapper_models'

ENV['RACK_ENV'] ||= 'development'

class Chitter < Sinatra::Base

  enable :sessions

  get '/' do
    @peep_list = Peep.all
    # .each {|peeps| "#{peeps.user} sez #{peeps.peep_text}" }
    # "#{Peep.get(1).user} sez #{Peep.get(1).peep_text}"

    erb :index
  end

  post '/newpeep' do
    raise "Username required" if params[:username] == ""
    peep_time = Time.now.strftime('%d/%m/%Y at %I:%M:%S %p')
    peep_text = params[:peep_text]
    user = params[:username]
    Peep.create(peep_text: peep_text, user: user, posttime: peep_time)
    redirect '/'
  end

  get '/signup' do
    erb :signup
  end

  post '/registered' do
    name = params[:name]
    user = params[:username]
    email = params[:email]
    password = params[:password]
    User.create(name: name, username: user, email: email, password: password)
    redirect '/'
  end

end
