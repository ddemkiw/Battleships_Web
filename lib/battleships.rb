require 'sinatra/base'

class BattleShips < Sinatra::Base

   get '/' do
    'Hello BattleShips!'
  end

  # get '/' do
  #   erb :index
  # end

  # get '/new_game' do
  #   erb :new_game
  # end



  # start the server if ruby file executed directly
  run! if app_file == $0

end
