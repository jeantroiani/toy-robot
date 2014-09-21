require_relative 'robot'
require_relative 'controller'

class ToyRobot
  attr_reader :robot, :controller

  def initialize(robot = Robot.new, controller = Controller.new)
    @robot, @controller = robot, controller
  end
  
  def run file_name
    controller.process file_name, robot
  end
end