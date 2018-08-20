require 'sinatra/extension'

require 'masterbrowser/helpers/serverlist'
require 'masterbrowser/helpers/playerlist'

module Api
  extend Sinatra::Extension
  set :protection, :except => [:json_csrf]
  
  before '/*' do |c|
    content_type :json
    headers 'Access-Control-Allow-Origin' => '*'
  end

  get '/servers/:game/?' do
    Serverlist.new(params[:game]).to_json
  end

  get '/players/:server/?' do
    Playerlist.new(params[:server]).to_json
  end
end
