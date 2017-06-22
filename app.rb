require 'sinatra/base'
require './lib/player.rb'

class Battle < Sinatra::Base

  enable :sessions

  get '/' do
    erb(:index)
  end

  post '/names' do
    $player_1 = Player.new(params['player_1'])
    $player_2 = Player.new(params['player_2'])
    redirect to('/play')
  end

  get '/play' do
    @player1_name = $player_1.name
    @player2_name = $player_2.name
    erb(:play)
  end

  post '/attack' do
    $player_1.attack($player_2)
    redirect to('/confirmation')
  end

  get '/confirmation' do
    erb(:attack)
  end

  run! if app_file == $0
end
