class Mars
  attr_accessor :x_length
  attr_accessor :y_length
  attr_accessor :lost_robot_coords

  def initialize(coords)
    self.x_length = coords[0]
    self.y_length = coords[1]
    self.lost_robot_coords = []
  end
end