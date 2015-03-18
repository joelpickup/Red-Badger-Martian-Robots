require_relative 'mars'
require_relative 'robot'

def menu
  puts 'Welcome to Mars!'
  mars = Mars.new(ask_for_mars_boundaries)
  send_robot(mars)
  send_robot(mars)
  send_robot(mars)
  gets
end

def ask_for_mars_boundaries
  print "Please enter the length of the Mars' X-axis(between 0-50):"
  x = ask_for_value
  print "Please enter the length of the Mars' Y-axis(MAX 50):"
  y = ask_for_value
  [x,y]
end

def ask_for_value
  x = gets.chomp
  while !/\A\d+\z/.match(x) || x.to_i < 0 || x.to_i > 50
    print "That was invalid; please try again."
    x = gets.chomp
  end
  x
end

def deploy_robot
  print "Please enter the Robot's position:"
  position = gets.chomp.upcase.split
  Robot.new(position)
end

def ask_for_instructions
  print "Please enter instructions for the robot:"
  instructions = gets.chomp.upcase.split("")
end

def send_robot(mars)
  robot = deploy_robot
  robot.move(ask_for_instructions, mars)
  print robot.position_string
  if robot.lost?
    mars.add_lost_robot_coord(robot)
  end
end

menu