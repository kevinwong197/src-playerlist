require_relative 'server/playerlist'

throw "STEAM_API_KEY not defined" unless ENV['STEAM_API_KEY']

if ENV["RACK_ENV"] == 'production'
  use Rack::Static, :urls => {'/' => 'index.html'}, :root => 'client/dist'
  run Rack::URLMap.new({
    '/'    => Rack::Directory.new('client/dist'),
    '/api' => App
  })
elsif ENV["RACK_ENV"] == 'development'
  run Rack::URLMap.new({'/api' => App})
else
  puts "RACK_ENV: #{ENV["RACK_ENV"]}"
end

