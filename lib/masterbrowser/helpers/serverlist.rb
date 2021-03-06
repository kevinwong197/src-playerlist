require 'json'
require 'http'
require 'uri'
require 'pp'

# encode: / => %5C
# show dedicated server only: \\dedicated\\1
# show non empty server only: \\empty\\1
class Serverlist
  def initialize gamedir
    @gamedir = gamedir
  end

  def querystr key: ENV['STEAM_API_KEY'], limit: 20000
    URI.encode_www_form({
      'key' => key,
      'filter' => "gamedir\\#{@gamedir}",
      'limit' => limit
    })
  end

  def apiurl
    'https://api.steampowered.com'
  end

  def route
    '/IGameServersService/GetServerList/v1/?'
  end

  def full_url
    apiurl + api_call
  end

  def api_call
    route + querystr
  end

  def content_type response
    "content-type: #{response['content-type']}"
  end

  def hostname
    URI.parse(full_url).host
  end

  def timeout_config
    [write: 1, connect: 1, :read => ENV['GET_SERVERS_TIMEOUT']&.to_i || 5]
  end

  def clean_utf8 txt
    txt.encode('UTF-8', 'UTF-8', invalid: :replace, undef: :replace)
  end

  def json2servers json
    json['response']['servers'] || []
  end

  def fill_unamed_servers servers
    servers.each do |server|
      server['name'] = server['name'] && server['name'].strip || 'unamed'
    end
  end

  def read_servers txt
    fill_unamed_servers json2servers JSON.parse clean_utf8 txt
  end

  def query
    return {status: "Error: STEAM_API_KEY not defined"} unless ENV['STEAM_API_KEY']
    response = HTTP.timeout(*timeout_config)
      .get(full_url)
    if response.status.ok?
      return {status: 'OK', servers: read_servers(response.to_s)}
    else
      return {status: "Error: #{response.code} #{response.reason}"}
    end
  rescue Exception => e
    {status: "Error: #{e.message}"}
  end

  def to_json
    query.to_json
  end
end

if $0 == __FILE__
  sq = Serverlist.new ''
  sq.query
  p sq.to_json
end
