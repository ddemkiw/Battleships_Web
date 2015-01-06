require 'sinatra/base'

class BattleShips < Sinatra::Base

  set :views, File.expand_path('../../views', __FILE__)

  get '/' do
    erb :index
  end

  get '/new_game' do 
    erb :new_game
  end 

  # start the server if ruby file executed directly
  run! if app_file == $0

end
