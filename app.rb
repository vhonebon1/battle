require 'sinatra/base'

class Battle < Sinatra::Base
  get '/' do
    erb(:index)
  end

enable :sessions
  post '/names' do
    session[:player_1] = params['player_1']
    session[:player_2] = params['player_2']
    p params
    p session
    @player1_name = session[:player_1]
    @player2_name = session[:player_2]
    erb(:play)
  end

  run! if app_file == $0
end
