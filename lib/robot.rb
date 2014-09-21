class Robot
  def placed?
    !@coordinate.nil?
  end

  def place coordinate, direction
    @coordinate, @direction = coordinate, direction
    self
  end

  def report
    check_if_robot_is_placed
    coordinate_and_direction.join(',')
  end

  def move
    check_if_robot_is_placed
    @coordinate.change_towards @direction
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