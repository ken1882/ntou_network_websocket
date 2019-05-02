require 'google_drive'
require 'socket'
require_relative 'lib/websocket_test'
#--------------------------------------------------------------------------
SPLIT_LINE = "----------------------------"
#--------------------------------------------------------------------------
def log_exception(e)
  STDERR.puts("#{SPLIT_LINE}\nAn error occurred!")
  info = sprintf("%s\n%s\n%s\n", SPLIT_LINE, Time.now.to_s, e)
  e.backtrace.each{|line| info += line + 10.chr} rescue nil
  STDERR.put("#{info}\n#{SPLIT_LINE}")
end
#--------------------------------------------------------------------------
WebsocketTest.init(ARGV.any?{|a| a == '-l'})
WebsocketTest.run