class Robot
  attr_accessor :x_coord
  attr_accessor :y_coord
  attr_accessor :orientation

  def intitialize(x,y,orientation)
    self.x_coord = x
    self.y_coord = y
    self.orientation = orientation
  end

end