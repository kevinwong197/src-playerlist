require 'json'
require 'net/http'
require 'uri'
require 'pp'

class Serverquery
  KEY = ENV['STEAM_API_KEY']

  def initialize mod
    @limit = 100
    @url = 'https://api.steampowered.com'
    @route = '/IGameServersService/GetServerList/v1/?' + URI.encode_www_form({
      'key' => KEY,
      # %5C
      'filter' => "gamedir\\#{mod}\\dedicated\\1\\empty\\1",
      'limit' => @limit
    })
    @list = []
  end

  def query
    answer = nil
    puts @url + @route
    Net::HTTP.start(URI.parse(@url + @route).host, open_timeout: 1, read_timeout: 1) do |http|
      resp = http.get(@route)
      if resp.code == '200'
        puts "content-type: #{resp['content-type']}"
        json = JSON.parse resp.body.force_encoding('UTF-8').encode('UTF-8', invalid: :replace, undef: :replace)
        data = json['response']['servers'] || []
        data.each do |server|
          server['name'] = server['name'] || 'unamed'
        end
        answer = {status: 'OK', servers: data}
      else
        answer = {status: "Error: #{resp.code} #{resp.message}"}
      end
    end
    return answer
  rescue SocketError, Net::OpenTimeout, Net::ReadTimeout => e
    {status: "Error: #{e.message}"}
  end

  def to_json
    pp query
    query.to_json
  end
end

if $0 == __FILE__
  sq = Serverquery.new ''
  sq.query
  p sq.to_json
end