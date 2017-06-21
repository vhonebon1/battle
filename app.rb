require 'sinatra/base'

class Battle < Sinatra::Base
  enable :sessions

  get '/' do
    erb(:index)
  end

  post '/names' do
    session[:player_1] = params['player_1']
    session[:player_2] = params['player_2']
    session[:player_2_hp] = 100
    redirect to('/play')
  end

  get '/play' do
    @player1_name = session[:player_1]
    @player2_name = session[:player_2]
    @player_2_hp = session[:player_2_hp]
    erb(:play)
  end

  run! if app_file == $0
end
