class Controller
  attr_reader :commands
  def initialize
    @commands = []
  end

  def read_file file_name
    @commands = File.open(file_name){|f| f.readlines }
  end
end