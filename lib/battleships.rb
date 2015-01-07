require 'sinatra/base'
require 'game'
require 'player'


class BattleShips < Sinatra::Base

  set :views, File.expand_path('../../views', __FILE__)

  # routes 

  get '/' do
    erb :index
  end

  get '/new_game' do 
    @game = Game.new
    erb :new_game
  end

  post '/form' do 
    @player1 = params[:player1]
    @player2 = params[:player2]
    erb :new_game
  end

  get '/setup_game' do 
    @player1 = Player.new
    @player2 = Player.new
    erb :setup_game
  end

  # start the server if ruby file executed directly
  run! if app_file == $0

end
