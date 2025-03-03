require_relative 'config/environment'

class App < Sinatra::Base

  configure do   
    enable :sessions
    set :session_secret, "secret"
  end

  get '/' do
    @session = session   
    erb :index 
  end

  post '/checkout' do
    @item_name = params[:item]
    session["item"] = params[:item]
    erb :cart
  end
end