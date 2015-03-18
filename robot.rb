class Robot
  attr_accessor :x_coord
  attr_accessor :y_coord
  attr_accessor :orientation
  attr_accessor :status

  def initialize(position)
    self.x_coord = position[0].to_i
    self.y_coord = position[1].to_i
    self.orientation = position[2]
    self.status = ""
  end

  def move(instructions, mars)
    instructions.each do |instruction|
      case instruction
      when 'L'
        turn('left')
      when 'R'
        turn('right')
      when 'F'
        move_forward(mars)
        if self.x_coord > mars.x_length || self.y_coord > mars.y_length || self.x_coord < 0 || self.y_coord < 0
          self.status = "LOST"
        end
      end
    end
  end

 def turn(direction)
  poles = ['N','E','S','W']
  current = poles.index(orientation)
    if direction == 'left'
      self.orientation = poles[current - 1]
    else
      if current + 1 == 4
        self.orientation = 'N'
      else
        self.orientation = poles[current + 1]
      end
    end
 end

  def move_forward(mars)
    case orientation
    when 'N'
      self.y_coord += 1
    when 'S'
      self.y_coord -= 1
    when 'E'
      self.x_coord += 1
    when 'W'
      self.x_coord -= 1 
    end
  end

  def position_string
    string = "#{x_coord} #{y_coord} #{orientation} #{status}"
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