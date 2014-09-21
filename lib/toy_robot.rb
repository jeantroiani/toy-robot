class ToyRobot
  attr_reader :robot, :controller

  def initialize(robot, controller)
    @robot, @controller = robot, controller
  end
  
  def run file_name
    controller.process_commands robot, file_name
  end
  
end