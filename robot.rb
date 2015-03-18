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

  def move(instructions)
    instructions.each do |instruction|
      case instruction
      when 'L'
        turn('left')
      when 'R'
        turn('right')
      when 'F'
        move_forward
      end
    end
  end

 def turn(direction)
  poles = ['N','E','S','W']
  current = poles.index(robot.orientation)
  if direction = 'left'
    robot.orienation = poles[current - 1]
  else
    robot.orientation = poles[current + 1]
  end
 end

  def move_forward
    case orientation
    when 'N'
      x_coord += 1
    when 'S'
      x_coord -= 1
    when 'E'
      x_coord += 1
    when 'W'
      x_coord -= 1 
  end
end