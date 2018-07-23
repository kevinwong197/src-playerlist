$LOAD_PATH << File.expand_path((File.dirname(__FILE__)))

require 'sinatra/base'
require 'sinatra/reloader'
require 'dotenv/load'

require 'masterbrowser/controllers/api'

class MasterBrowser < Sinatra::Base
  configure :development do
    enable :logging
    register Sinatra::Reloader

    Dir.glob('**/*.rb') {|path| also_reload path}
    after_reload do
      puts 'reloaded'
    end
  end

  register Api
end
