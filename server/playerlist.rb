$LOAD_PATH << File.expand_path((File.dirname(__FILE__)))

require 'sinatra/base'

require 'playerlist/controllers/api'

class App < Sinatra::Base
  configure :development do
    enable :logging
  end

  register Api
end
