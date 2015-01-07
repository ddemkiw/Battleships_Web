require 'sinatra/base'
require_relative 'game'
require_relative 'player'
require_relative 'ship'
require_relative 'board'
require_relative 'cell'

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

  post '/form' do # rename to register
    @player1_name = (session[:player1] = params[:player1])
    @player2_name = (session[:player2] = params[:player2])
    erb :new_game
  end

#convert ship from string to object
#coords from string to symbo
#convert orientation to symbo (possible drop down)
#use add_ship function from game  
  post '/set_ships' do 
    session[:ship] = params[:ship]
    session[:coord] = params[:coord]
    session[:orientation] = params[:orientation]
    redirect "/setup_game"
  end


  get '/setup_game' do # rename to play game
    @game = Game.new
    setup(@player1, session[:player1])
    setup(@player2, session[:player2])
    @ship = @fleet1.select { |ship| ship.name.first == session[:ship]  }
    puts @ship.inspect
    @coord = session[:coord]
    x = @coord.to_s.to_sym
    if @ship
      p @board1.place(@ship, x)
    end

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
