class ToyRobot
  attr_reader :robot, :controller, :coordinate_class, :direction_class

  def initialize(robot, controller, coordinate_class, direction_class)
    @robot, @controller, @coordinate_class, @direction_class = robot, controller, coordinate_class, direction_class
  end
  
  def run file_name
    controller.process_commands robot, file_name, coordinate_class, direction_class
  end
  
end