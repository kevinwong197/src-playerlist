$LOAD_PATH << File.expand_path((File.dirname(__FILE__)))

require 'sinatra/base'
require 'dotenv/load'

require 'masterbrowser/controllers/api'

class MasterBrowser < Sinatra::Base
  configure :development do
    enable :logging
  end

  register Api
end
