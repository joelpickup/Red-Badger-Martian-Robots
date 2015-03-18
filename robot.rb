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

  def move(instructions, mars)
    instructions.each do |instruction|
      case instruction
      when 'L'
        turn('left')
      when 'R'
        turn('right')
      when 'F'
        if status = "DEPLOYED"
          move_forward(mars)
          if x_coord > mars.x_length || y_coord > mars.y_length || x_coord < 0 || y_coord < 0
            lose_self
          end
        end
      end
    end
  end

 def turn(direction)
  poles = ['N','E','S','W']
  current = poles.index(robot.orientation)
  if direction == 'left'
    robot.orientation = poles[current - 1]
  else
    robot.orientation = poles[current + 1]
  end
 end

  def move_forward(mars)
      case orientation
      when 'N'
        y_coord += 1
      when 'S'
        y_coord -= 1
      when 'E'
        x_coord += 1
      when 'W'
        x_coord -= 1 
      end
  end

  def position_string
    string = "#{x_coord} #{y_coord} #{orientation}"
    string + " LOST" if status == "LOST"
  end

  def lose_self
    status = "LOST"
  end

  def lost?
    status == "LOST"
  end

  def coords
    [x_coord, y_coord]
  end
end