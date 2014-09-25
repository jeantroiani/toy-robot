class Coordinate
  MINIMUM = 0
  MAXIMUM = 4

  attr_reader :x, :y

  def initialize(options)
    @x = options.fetch(:x, 0)
    @y = options.fetch(:y, 0)
    check_for_out_of_bounds @x, @y
  end

  def to_s
    "#{x},#{y}"
  end

  def to_a
    [x, y]
  end

  def x=(x)
    check_for_out_of_bounds x
    @x = x
  end

  def y=(y)
    check_for_out_of_bounds y
    @y = y
  end

  def change_position_towards direction
    axis, amount = MOVEMENT_MAP[direction.to_sym]
    position_change_on axis, amount
  end

  private
  MOVEMENT_MAP = {
    :NORTH => [:y, 1],
    :SOUTH => [:y, -1],
    :EAST => [:x, 1],
    :WEST => [:x, -1]
  }

  def check_for_out_of_bounds(*coordinates)
    raise 'Out of Bounds' if is_out_of_bounds? *coordinates
  end

  def is_out_of_bounds?(*coordinates)
    coordinates.any?{ |coordinate| is_invalid?(coordinate) }
  end

  def is_invalid?(coordinate)
    coordinate < MINIMUM || coordinate > MAXIMUM 
  end

  def position_change_on axis, amount
    amount += current_value_of axis
    self.send(setter_of(axis), amount)
  end

  def setter_of axis
    "#{axis}=".to_sym
  end

  def current_value_of axis
    self.instance_variable_get("@#{axis}")
  end
end