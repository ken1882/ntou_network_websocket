#=============================================================================
#
#=============================================================================
class CodeCollection
  #--------------------------------------------------------------------------
  attr_reader :instance, :title, :id
  attr_reader :cloud_usage_file, :local_usage_path, :code_filename
  #--------------------------------------------------------------------------
  def initialize(instance)
    @instance = instance
    @id = instance.id
    @cloud_usage_file = instance.files.find{|f| f.title == 'used.txt'}
    @usage_data = [false]
    download_files
  end
  #--------------------------------------------------------------------------
  def [](idx)
    return @usage_data[idx]
  end
  #--------------------------------------------------------------------------
  def download_files
    path = DataManager::DataPath + @instance.title
    Dir.mkdir(path) unless File.exist?(path)
    @instance.files.each do |file|
      filename = path + '/' + file.title
      File.open(path, 'w'){} unless File.exist?(path)
      file.download_to_file(filename)
    end
    load_code_usage(path)
  end
  #--------------------------------------------------------------------------
  def load_code_usage(group_path)
    @local_usage_path = "#{group_path}/used.txt"
    @code_filename    = "#{group_path}/codes.txt"
    File.open(@code_filename, 'r') do |file|
      while file.gets
        @usage_data << false
      end
    end
    File.open(@local_usage_path, 'r') do |file|
      while (line = file.gets)
        next unless line && line.length > 0
        @usage_data[line.to_i] = true
      end
    end
  end
  #--------------------------------------------------------------------------
  def process_code(code)
    re = check_code_exist(code)
    return 404 unless re
    mark_used(re)
    update_local_file
    update_cloud_file
    return 200
  end
  #--------------------------------------------------------------------------
  def check_code_exist(code)
    code = code.strip.upcase
    File.open(@code_filename, 'r') do |file|
      cnt = 1
      while (line = file.gets)
        return cnt if !@usage_data[cnt] && line.strip.upcase == code
        cnt += 1
      end
    end
    return false
  end
  #--------------------------------------------------------------------------
  def mark_used(idx)
    STDERR.puts("#{idx} used")
    @usage_data[idx] = true
  end
  #--------------------------------------------------------------------------
  def update_local_file
    File.open(@local_usage_path, 'w') do |file|
      @usage_data.each_with_index do |b, i|
        file.write(i.to_s + 10.chr) if b
      end
    end
  end
  #--------------------------------------------------------------------------
  def update_cloud_file
    @cloud_usage_file.update_from_file(@local_usage_path)
  end
  #--------------------------------------------------------------------------
end