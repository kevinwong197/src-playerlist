require 'sinatra/extension'

require 'playerlist/helpers/serverquery'
require 'playerlist/helpers/playerquery'

module Api
  extend Sinatra::Extension
  set :protection, :except => [:json_csrf]
  
  before '/*' do |c|
    content_type :json
    headers 'Access-Control-Allow-Origin' => '*'
  end

  get '/servers/:game/?' do
    Serverquery.new(params[:game]).query
  end

  get '/players/:server/?' do
    Playerquery.new(params[:server]).query
  end
end
