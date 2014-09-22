require_relative 'file_parser'

class Controller
  attr_reader :file_parser
  def initialize(file_parser = FileParser)
    @file_parser = file_parser
  end

  def process command_file, robot
    commands = file_parser.parse command_file
    run commands, robot
    nil
  end
  
  private
  def generated command
    method, params = command
    [formatted(method), params].flatten.compact
  end

  def formatted method
    method.downcase.to_sym
  end

  def run commands, robot
    commands.each { |command| execute command, robot }
  end

  def execute command, robot
    begin
      robot.send(*generated(command))
    rescue Exception => e
      puts e.message
    end
  end
end