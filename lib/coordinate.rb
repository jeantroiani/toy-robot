class Coordinate
  MINIMUM = 0
  MAXIMUM = 4

  attr_reader :x, :y

  def initialize(x, y)
    raise 'Out of Bounds' if is_out_of_bounds?(x, y)
    @x = x
    @y = y
  end

  def to_s
    "#{x},#{y}"
  end

  def to_a
    [x, y]
  end

  def x=(x)
    raise 'Out of Bounds' if is_out_of_bounds? x
    @x = x
  end

  def y=(y)
    raise 'Out of Bounds' if is_out_of_bounds? y
    @y = y
  end

  private
  def is_out_of_bounds?(*coordinates)
    coordinates.any?{ |coordinate| is_invalid?(coordinate) }
  end

  def is_invalid?(coordinate)
    coordinate < MINIMUM || coordinate > MAXIMUM 
  end
end