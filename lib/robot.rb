class Robot
  def placed?
    !@coordinate.nil?
  end

  def place_at coordinate
    @coordinate = coordinate
  end

  def status
    @coordinate.to_a
  end
end