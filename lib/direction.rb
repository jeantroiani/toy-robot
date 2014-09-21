class Direction
  def initialize(options)
    direction = options.fetch(:facing, :NORTH)
    create_compass_from direction.upcase
  end

  def turn direction
    @compass.rotate! around_to(direction)
    self
  end

  def to_s
    current_direction.to_s
  end

  def to_a
    [self.to_s]
  end

  def to_sym
    current_direction
  end

  private
  VALID_DIRECTIONS = [:NORTH, :EAST, :SOUTH, :WEST].freeze
  LEFT = -1
  RIGHT = 1

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

  def current_direction
    @compass.first
  end
end