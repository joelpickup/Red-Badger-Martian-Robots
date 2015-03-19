require_relative '../mars.rb'

describe '#add_lost_robot_coord' do
  it 'adds the lost_coords of a robot to mars lost_robot_coords array' do
    mars = Mars.new(['5','3'])
    robot = Robot.new(['1','1','E'])
    robot.lost_coords = [2,4]
    mars.add_lost_robot_coord(robot)
    expect(mars.lost_robot_coords).to eq [[2,4]]
  end
end

