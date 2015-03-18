class Mars
  attr_accessor :x_length
  attr_accessor :y_length
  attr_accessor :lost_robot_coords

  def initialize(coords)
    self.x_length = coords[0].to_i
    self.y_length = coords[1].to_i
    self.lost_robot_coords = []
  end

  def add_lost_robot_coord(robot)
    lost_robot_coords.push(robot.coords)
  end
end