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
      redirect '/setup_game'
    end
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
    
    setup(session[:player1])
    setup(session[:player2])
    erb :setup_game

    # if @fleet1.empty?
    #   place_p2_ships
    # else 
    #   place_p1_ships      
    # end 

  end

  # start the server if ruby file executed directly
  run! if app_file == $0

  private

    def setup(name)
      @player1 = Player.new
      @player2 = Player.new
      @player1.name = name
      @player2.name = name
      @fleet1 = [Ship.battleship]
      @fleet2 = [Ship.battleship]
      @board1 = Board.new(Cell)
      @board2 = Board.new(Cell)
      GAME.add_player(@player1)
      GAME.add_player(@player2)
      @player1.board = @board1
      @player2.board = @board2
    end 

    def place_p2_ships
      @p2_find_ship = @fleet2.select { |ship| ship.name.first == session[:ship]  }
      @coord = session[:coord]
      @coord = @coord.to_s.to_sym

      if !@p2_find_ship.empty? && @board2.place(@p2_find_ship, @coord)
        @placed = true
        @fleet1.delete(@p2_find_ship)
      end
    end 

    def place_p1_ships
      @p1_find_ship = @fleet1.select { |ship| ship.name.first == session[:ship]  }
      @coord = session[:coord]
      @coord = @coord.to_s.to_sym
          
      if !@p1_find_ship.empty? && @board1.place(@p1_find_ship, @coord)
        @placed = true
        @fleet1.delete(@p1_find_ship)
      end  
    end

  

end
