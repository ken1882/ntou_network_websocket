require_relative 'DataManager'
require_relative 'code_collection'
require_relative 'websocket_test/version'
#=============================================================================
module WebsocketTest
  #--------------------------------------------------------------------------
  GDriveParentID = '15YrGWcg5fAzQrASzGwEOeoJEgvWPDE9v'
  #--------------------------------------------------------------------------
  module_function
  #--------------------------------------------------------------------------
  def init(local=false)
    puts "Running localhost" if local
    @port   = ENV['GCP_RubyHost'].split(':').last.to_i
    @server = TCPServer.new(local ? 'localhost' : '0.0.0.0', @port)
    @running = false
    @valid_prefix = {}
    connect_gdrive
  end
  #--------------------------------------------------------------------------
  def connect_gdrive
    File.open('.gdtmp', 'w'){|f| f.write(ENV['GDrive_SAK'])}
    @gdrive_session = GoogleDrive::Session.from_service_account_key('.gdtmp') 
    File.delete('.gdtmp')
    @gdrive_parent_folder = @gdrive_session.file_by_id(GDriveParentID)
    STDERR.puts "Connected to GDrive: #{@gdrive_parent_folder}" if @gdrive_parent_folder
    load_gdrive_files
  end
  #--------------------------------------------------------------------------
  def load_gdrive_files
    @gdrive_parent_folder.files.each do |folder|
      @valid_prefix[folder.title.to_sym] = CodeCollection.new(folder)
    end
  end
  #--------------------------------------------------------------------------
  def load_code_usage(group)
    ar = []
    File.open("data/#{group}/codes.txt", 'r') do |file|
      while (line = file.gets)
        ar << false
      end
    end
    File.open("data/#{group}/used.txt", 'r') do |file|
      while (line = file.gets)
        next unless line && line.length > 0
        ar[line.to_i] = true
      end
    end
    @valid_prefix[group.to_sym] = ar
  end
  #--------------------------------------------------------------------------
  def run
    STDERR.puts 'Server is running'
    @running = true
    while @running
      socket = @server.accept
      Thread.start do
        begin
          socket.puts(interpret_message(socket))
        rescue Exception => err
          log_exception(err)
          socket.puts(500)
        ensure
          socket.close
        end
      end # Thread
    end # while running
  end
  #--------------------------------------------------------------------------
  def interpret_message(socket)
    STDERR.puts "Incoming Request from #{socket.addr}"
    msg = socket.gets(30).chomp
    STDERR.puts "Received message #{msg}"
    op, arg = msg.split('?')
    case op
    when 'GETGFT'
      return socket.puts(process_gift_code(arg))
    else
      return 400
    end
  end
  #--------------------------------------------------------------------------
  def process_gift_code(code)
    group, code = code[0...5].to_sym, code[5..-1]
    @valid_prefix.each do |sym, collection|
      return collection.process_code(code) if group == sym
    end
    return 404
  end
  #--------------------------------------------------------------------------
end