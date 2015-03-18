class Robot
  attr_accessor :x_coord
  attr_accessor :y_coord
  attr_accessor :orientation
  attr_accessor :status

  def initialize(position)
    self.x_coord = position[0].to_i
    self.y_coord = position[1].to_i
    self.orientation = position[2]
    self.status = "DEPLOYED"
  end

end