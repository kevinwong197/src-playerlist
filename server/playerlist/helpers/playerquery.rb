require 'json'
require 'socket'

class Playerquery
  def initialize ipport
    @ip, @port = ipport.split(':')
    @list = []
  end

  def query
    @ds = UDPSocket.new
    get_challenge
    get_players
    {status: 'OK', players: @list}.to_json
  rescue IO::EWOULDBLOCKWaitReadable => e
    {status: 'Connection Timeout'}.to_json
  rescue Errno::ECONNRESET => e
    {status: 'Connection Refused'}.to_json
  end

private
  def get_challenge
    @ds.send([-1].pack('l')+'U'+[-1].pack('l'), 0, @ip, @port)
    IO.select([@ds], nil, nil, 1)
    @challenge, _ = @ds.recvfrom_nonblock(1024)
  end

  def get_players
    @ds.send([-1].pack('l')+'U'+@challenge.split('A', 2)[1], 0, @ip, @port)
    IO.select([@ds], nil, nil, 1)
    @data, _ = @ds.recvfrom_nonblock(1024)

    if @data[4] == 'D'
      @data = @data.split('D', 2)[1]
      if (players = @data.unpack('h')[0].to_i) > 0
        @data = @data[1..-1]
        @list = @data
          .unpack('h Z* l e '*players)
          .each_slice(4)
          .to_a
          .map { |player|
          {
            :name => (player[1] != '') && player[1].force_encoding('utf-8') || 'unconnected',
            :score => player[2] || 'N/A',
            :time => player[3] && Time.at(player[3]).utc.strftime("%H:%M:%S") || 'N/A'
          }
        }
      end
    else
      @list = []
    end
    @ds.close
  end
end

if $0 == __FILE__
  threads = []
  10.times do
    threads << Thread.new do
      wa = Playerquery.new '183.131.85.109:27110'
      wa.query
      p wa.list
    end
  end
  threads.each(&:join)
end

