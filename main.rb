require_relative 'mars'

def menu
  puts 'Welcome to Mars!'
  mars = Mars.new(ask_for_mars_boundaries)
  print mars.x_length
  print mars.y_length
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

menu