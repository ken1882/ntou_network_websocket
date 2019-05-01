require 'socket'

ip, port = ENV['GCP_RubyHost'].split(':')
s = TCPSocket.new(ip, port)
s.send('Hello World!', 0)
s.close