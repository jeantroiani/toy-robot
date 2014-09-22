class FileParser
  def self.parse command_file
    commands = read_file command_file
    split_into_methods_and_params_for commands
    parse_params_for commands
  end
  
  private
  def self.read_file command_file
    File.open(command_file){|f| f.readlines }.map(&:chomp)
  end

  def self.split_into_methods_and_params_for commands
    commands.map!(&:split)
  end

  def self.parse_params_for commands
    commands.map! do |command|
      method, params = command
      params = split_and_convert params unless params.nil?
      [method, params]
    end
  end

  def self.split_and_convert params
    params.split(',').map {|param| is_numeric?(param) ? param.to_i : param }
  end

  def self.is_numeric? string
    string =~ /\d/
  end  
end