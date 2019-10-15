require 'sinatra/base'
require 'shotgun'
require 'capybara'
require 'selenium-webdriver'

class Battle < Sinatra::Base

  enable :sessions

  get '/' do
    erb :index
  end

  get '/infra' do
    'Testing infrastructure working!'
  end

  post '/names' do
    session[:player_one] = params[:player_one]
    session[:player_two] = params[:player_two]
    redirect '/play'
  end

  get '/play' do
    @player_one = session[:player_one]
    @player_two = session[:player_two]
    erb :play
  end

end
