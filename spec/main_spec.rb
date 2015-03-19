require_relative 'spec_helper'
require_relative '../robot'
require_relative '../mars'

describe '#move' do
  it "moves according to instructions" do
    mars = Mars.new(['5','3'])
    robot = Robot.new(['1','1','E'])
    robot.move('RFRFRFRF'.split(""), mars)
    expect(robot.position_string).to eq '1 1 E'
  end
end

describe '#move' do
  it 'displays lost if moves out of boundaries' do
    mars = Mars.new(['5','3'])
    robot = Robot.new(['3','2','N'])
    robot.move('FRRFLLFFRRFLL'.split(""), mars)
    expect(robot.position_string).to eq '3 3 N LOST'
  end
end

describe '#move' do
  it "should disregard a move if robot fallen off already, and finish instructions" do
    mars = Mars.new(['5','3'])
    robot = Robot.new(['0','3','W'])
    robot.move('LLFFFLFLFL'.split(""), mars)
    expect(robot.position_string).to eq '2 4 S LOST'
    mars.lost_robot_coords.push([3,4])
    robot = Robot.new(['0','3','W'])
    robot.move('LLFFFLFLFL'.split(""), mars)
    expect(robot.position_string).to eq '2 3 S'
  end
end