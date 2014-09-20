class Robot
  def placed?
    !@coordinate.nil?
  end

  def place_at coordinate, direction
    @coordinate = coordinate
    @direction = direction
    self
  end

  def status
    @coordinate.to_a + @direction.to_a
  end

  def move
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

  private
  def direction_facing
    @direction.to_s
  end
end