require 'sinatra/base'

class BattleShips < Sinatra::Base

  set :views, File.expand_path('../../views', __FILE__)

  get '/' do
    erb :index
  end

  get '/new_game' do 
    erb :new_game
  end

  post '/form' do 
    @player1 = params[:player1]
    @player2 = params[:player2]
    puts params.inspect
    erb :new_game
  end



  # start the server if ruby file executed directly
  run! if app_file == $0

end
