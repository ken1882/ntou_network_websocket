require_relative 'websocket_test/version'

module WebsocketTest
  module_function

  def init
    @server = TCPServer.new('localhost', '8080')
    @running = false
  end

  def run
    STDERR.puts 'Server is running'
    @running = true
    while @running
      socket = @server.accept
      STDERR.puts 'Incoming Request'
      http_request = ''
      while (line = socket.gets) && (line != "\r\n")
        http_request += line
      end
      STDERR.puts http_request
      socket.close
    end
  end
end