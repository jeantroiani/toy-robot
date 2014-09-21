class Controller
  attr_reader :commands
  def initialize
    @commands = []
  end

  def process_commands robot, command_file
    parse command_file
    @commands.each { |command| execute command, robot }
    nil
  end
  
  private
  def parse command_file
    read_file command_file
    split_commands_into_methods_and_params
    parse_params
  end

  def read_file command_file
    @commands = File.open(command_file){|f| f.readlines }.map(&:chomp)
  end

  def split_commands_into_methods_and_params
    @commands.map!(&:split)
  end

  def parse_params
    @commands.map! do |command|
      method, params = command
      params = split_and_convert params unless params.nil?
      [method, params]
    end
  end

  def split_and_convert params
    params.split(',').map {|param| is_numeric?(param) ? param.to_i : param }
  end

  def is_numeric? string
    string =~ /[0-9]/
  end

  def generate command
    method, params = command
    [formatted(method), params].flatten.compact
  end

  def formatted method
    method.downcase.to_sym
  end

  def execute command, robot
    begin
      robot.send(*generate(command))
    rescue Exception => e
      puts e.message
    end
  end
end