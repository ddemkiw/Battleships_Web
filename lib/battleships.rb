require 'sinatra/base'
require_relative 'game'
require_relative 'player'
require_relative 'ship'
require_relative 'board'
require_relative 'cell'

class BattleShips < Sinatra::Base

  enable :sessions

  set :views, File.expand_path('../../views', __FILE__)

   GAME = Game.new

  # routes 

  get '/' do
    erb :index
  end

  get '/new_game' do 
    erb :new_game
  end

  # we are giving each player a name and setting it in session (cookies)

  post '/form' do # rename to register
    # session[:player_name] = 
    name = params[:player]
    if name.nil? || name.empty?
      redirect '/new_game'
    else
      @player = Player.new
      @player.name = name
      session[:me] = name
      session[:player_id] = @player.object_id
      p session.inspect
      GAME.add_player(@player)
      redirect '/setup_game'
    end
    erb :new_game
  end

  #convert ship from string to object
  #coords from string to symbo
  #convert orientation to symbo (possible drop down)
  #use add_ship function from game  
  post '/set_ships' do 
    player = ObjectSpace._id2ref(session[:player_id])
    p player.inspect
    p player.board.inspect
    player.board.place(Ship.battleship, params[:coord].to_sym, params[:orientation].to_sym)
    redirect "/setup_game"
  end


  get '/setup_game' do # rename to play game
    session[:board] = (Board.new(Cell)).object_id
    session[:fleet] = [Ship.battleship].object_id
    player = ObjectSpace._id2ref(session[:player_id])
    player.board = ObjectSpace._id2ref(session[:board])
    p session.inspect
    erb :setup_game 
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
  

end
