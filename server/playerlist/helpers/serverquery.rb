require 'json'
require 'net/http'
require 'uri'

class Serverquery
  KEY = ENV['STEAM_API_KEY']

  def initialize mod
    @limit = 25
    @url = 'https://api.steampowered.com'
    @route = '/IGameServersService/GetServerList/v1/?' + URI.encode_www_form({
      'key' => KEY,
      'filter' => "gamedir\\#{mod}",
      'limit' => @limit
    })
    @list = []
  end

  def query
    answer = nil
    Net::HTTP.start(URI.parse(@url + @route).host, open_timeout: 1, read_timeout: 1) do |http|
      resp = http.get(@route)
      if resp.code == '200'
        json = JSON.parse resp.body.to_s #.force_encoding("UTF-8").encode("UTF-16")
        data = json['response']['servers'] || []
        data.each do |server|
          server['name'] = server['name']&.gsub("\u{0001}", '') || 'unamed'
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
  sq = Serverquery.new 'obsidian'
  sq.query
  p sq.to_json
end