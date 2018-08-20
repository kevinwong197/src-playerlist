require 'json'
require 'socket'
require 'pp'

class Playerlist
  def initialize ipport
    @ip, @port = ipport.split(':')
    @ds = UDPSocket.new
  end

  def query
    challenge_packet = get_challenge_packet
    if flag(challenge_packet) == 'A'
      players_packet = get_players_packet read_challenge challenge_packet
      if flag(players_packet) == 'D'
        list = read_players players_packet
        {status: 'OK', players: list}
      else
        {status: "Unexpected Players Response: #{flag(challenge_packet)}"}
      end
    else
      {status: "Unexpected Challenge Response: #{flag(challenge_packet)}"}
    end
  rescue IO::EWOULDBLOCKWaitReadable => e
    {status: 'Server Not Responding'}
  rescue Errno::ECONNRESET => e
    {status: 'Connection Refused'}
  ensure
    @ds.close
  end

  def to_json
    query.to_json
  end

  def oob_header
    [-1].pack('l')
  end

  def init_challenge
    [-1].pack('l')
  end

  def timeout_config
    ENV['GET_PLAYERS_TIMEOUT']&.to_i || 5
  end

  def get_challenge_packet
    @ds.send(oob_header + 'U' + init_challenge, 0, @ip, @port)
    wait_timeout
    @ds.recvfrom_nonblock(1024).first
  end

  def wait_timeout
    IO.select([@ds], nil, nil, timeout_config)
  end

  def read_challenge challenge_packet
    after_flag(challenge_packet, 'A')
  end

  def after_flag packet, flag
    packet.split(flag, 2).last
  end

  def parse_playercount players_packet
    after_flag(players_packet, 'D').unpack('v').first.to_i
  end

  def flag packet
    packet[4]
  end

  def parse_players players_packet, player_count
    after_flag(players_packet, 'D')[1..-1]
      .unpack('h Z* l e ' * player_count)
      .each_slice(4)
      .to_a
  end

  def clean_utf8 txt
    txt.encode('UTF-8', 'UTF-8', invalid: :replace, undef: :replace)
  end

  def format_time time_bytes
    Time.at(time_bytes).utc.strftime("%H:%M:%S")
  end

  def player_hash player_bytes
    player_name = clean_utf8(player_bytes[1]).strip
    {
      :name => (player_name != '') && player_name || 'unconnected',
      :score => player_bytes[2] && player_bytes[2].to_i || 'N/A',
      :time => player_bytes[3] && format_time(player_bytes[3]) || 'N/A'
    }
  end

  def read_players players_packet
    player_count = parse_playercount players_packet
    if player_count > 0
      parse_players(players_packet, player_count).map do |player|
        player_hash player
      end
    else
      []
    end
  end

  def get_players_packet challenge
    @ds.send(oob_header + 'U' + challenge, 0, @ip, @port)
    wait_timeout
    @ds.recvfrom_nonblock(1024).first
  end
end

if $0 == __FILE__
  q = Playerlist.new ''
  pp q.query
end

