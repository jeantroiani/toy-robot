require_relative 'coordinate'
require_relative 'direction'

class Robot
  attr_reader :coordinate_class, :direction_class

  def initialize(coordinate_class = Coordinate, direction_class = Direction)
    @coordinate_class, @direction_class = coordinate_class, direction_class
  end

  def placed?
    !@coordinate.nil?
  end

  def place x, y, facing
    @coordinate = coordinate_class.new(x: x, y: y)
    @direction = direction_class.new(facing: facing)
    nil
  end

  def report
    check_if_robot_is_placed
    puts coordinate_and_direction.join(',')
    self
  end

  def move
    check_if_robot_is_placed
    @coordinate.change_position_towards @direction
    self  
  end

  def left
    check_if_robot_is_placed
    @direction.turn 'left'
    self
  end

  def right
    check_if_robot_is_placed
    @direction.turn 'right'
    self
  end

  private
  def coordinate_and_direction
    @coordinate.to_a + @direction.to_a
  end

  def check_if_robot_is_placed
    raise 'Cannot perform that action! Please place the robot first' unless placed?
  end
end