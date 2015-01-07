require 'sinatra/base'
require 'game'
require 'player'
require 'ship'
require 'board'
require 'cell'

class BattleShips < Sinatra::Base

  enable :sessions

  set :views, File.expand_path('../../views', __FILE__)

  # routes 

  get '/' do
    erb :index
  end

  get '/new_game' do 
    erb :new_game
  end

  post '/form' do 
    @player1_name = (session[:player1] = params[:player1])
    @player2_name = (session[:player2] = params[:player2])
    erb :new_game
  end

  get '/setup_game' do # rename to play game
    @game = Game.new
    setup(@player1, session[:player1])
    setup(@player2, session[:player2])
    erb :setup_game
  end

  # start the server if ruby file executed directly
  run! if app_file == $0

  private

    def setup(player, name)
      player = Player.new
      player.name = name
      @fleet1 = [Ship.aircraft_carrier, Ship.battleship, Ship.destroyer, Ship.submarine, Ship.patrol_boat ]
      @board1 = Board.new(Cell)
      @game.add_player(player)
      player.board = @board1
    end 

end
