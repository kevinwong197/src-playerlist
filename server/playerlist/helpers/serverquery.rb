require 'json'
require 'net/http'
require 'uri'

class Serverquery
  KEY = ENV['STEAM_API_KEY']

  def initialize mod # gamedir: nil, appid: nil, limit: 15, map: ''
    @url = 'https://api.steampowered.com'
    # URI.encode_www_form({:filter => "map\\#{map}",
    @route = %Q{
      /IGameServersService/GetServerList/v1/?key=#{KEY}&filter=gamedir%5C#{mod}%5Cempty%5C1&limit=20
    }.strip
    @list = []
  end

  def query
    json = nil
    Net::HTTP.start(URI.parse(@url + @route).host, open_timeout: 1, read_timeout: 1) do |http|
      json = JSON.parse http.get(@route).body.to_s
    end
    data = json['response']['servers'] || []
    data.each do |server|
      server['name'] = server['name']&.gsub("\u{0001}", '') || 'unamed'
    end
    {status: 'OK', servers: data}.to_json
  rescue Net::OpenTimeout, Net::ReadTimeout => e
    {status: 'Connection Timeout'}.to_json
  rescue SocketError => e
    {status: 'API Failure'}.to_json
  end
end

if $0 == __FILE__
  sq = Serverquery.new 'obsidian'
  sq.query
  p sq.to_json
end