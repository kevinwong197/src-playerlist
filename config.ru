require_relative 'server/masterbrowser'

if ENV["RACK_ENV"] == 'production'
  use Rack::Static, :urls => {'/' => 'index.html'}, :root => 'client/dist'
  run Rack::URLMap.new({
    '/'    => Rack::Directory.new('client/dist'),
    '/api' => MasterBrowser
  })
elsif ENV["RACK_ENV"] == 'development'
  run Rack::URLMap.new({'/api' => MasterBrowser})
else
  puts "RACK_ENV: #{ENV["RACK_ENV"]}"
end

