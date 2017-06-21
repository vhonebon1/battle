require 'sinatra/base'

class Battle < Sinatra::Base
  get '/' do
    erb(:index)
  end

  post '/names' do
    @player1_name = params[:player_1]
    @player2_name = params[:player_2]
    erb(:play)
  end

  run! if app_file == $0
end
