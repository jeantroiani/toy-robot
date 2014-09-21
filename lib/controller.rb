class Controller
  attr_reader :commands
  def initialize
    @commands = []
  end

  def process_commands robot, command_file, coordinate, direction
    parse command_file
    @commands.each do |command|
      method, params = command
      params_hash = generate_hash_from params
      begin
        puts generate_command_from method, params
        if params.nil?
          robot.send(method.downcase.to_sym)
        else
          robot.send(method.downcase.to_sym, 
                     coordinate.new(params_hash),
                     direction.new(params_hash))
        end
      rescue Exception => e
        puts e.message
      end
    end
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
    string.match(/[0-9]/)
  end

  def generate_hash_from params
    params.nil? ? nil : {x: params[0], y: params[1], facing: params[2]}
  end

  def generate_command_from method, params
    [formatted(method), params].compact
  end

  def formatted method
    method.downcase.to_sym
  end
end
__END__
[method,params].compact