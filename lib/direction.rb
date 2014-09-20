class Direction
  VALID_DIRECTIONS = [:NORTH, :EAST, :SOUTH, :WEST].freeze
  LEFT = -1
  RIGHT = 1

  def initialize(direction)
    create_compass_from direction.upcase
  end

  def to_s
    @compass.first.to_s
  end

  def turn direction
    @compass.rotate! around_to(direction)
    self
  end

  private
  def around_to direction
    self.class.const_get(direction.upcase)
  end

  def create_compass_from direction
    raise 'Incorrect direction' unless is_valid? direction
    @compass = VALID_DIRECTIONS.dup
    self.turn 'right' until the_same? direction
  end

  def the_same? direction 
    @compass.first == direction.to_sym
  end

  def is_valid? direction
    VALID_DIRECTIONS.any?{ |bearing| bearing == direction.to_sym }
  end
end