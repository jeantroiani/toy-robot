class Robot
  def placed?
    !@coordinate.nil?
  end

  def place coordinate, direction
    @coordinate, @direction = coordinate, direction
    self
  end

  def status
    @coordinate.to_a + @direction.to_a
  end

  def move
    check_if_robot_is_placed
    case direction_facing
    when 'NORTH'
      @coordinate.y += 1
    when 'WEST'
      @coordinate.x -= 1
    when 'SOUTH'
      @coordinate.y -= 1
    when 'EAST'
      @coordinate.x += 1
    end
    self  
  end

  def left
    check_if_robot_is_placed
    @direction.turn 'left'
  end

  def right
    check_if_robot_is_placed
    @direction.turn 'right'
  end

  private
  def direction_facing
    @direction.to_s
  end

  def check_if_robot_is_placed
    raise 'Cannot perform that action! Please place the robot first' unless placed?
  end
end