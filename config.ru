require_relative 'lib/masterbrowser'

if ENV["RACK_ENV"] == 'production'
  use Rack::Static, :urls => {'/' => 'index.html'}, :root => 'frontend/dist'
  run Rack::URLMap.new({
    '/'    => Rack::Directory.new('frontend/dist'),
    '/api' => MasterBrowser
  })
elsif ENV["RACK_ENV"] == 'development'
  run Rack::URLMap.new({'/api' => MasterBrowser})
else
  puts "RACK_ENV: #{ENV["RACK_ENV"]}"
end

