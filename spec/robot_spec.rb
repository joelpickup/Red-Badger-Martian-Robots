require_relative 'spec_helper'
require_relative '../robot'

describe '#position_string' do
  it "returns a string of the robot's positon" do
    robot = Robot.new(['1','1','E'])
    expect(robot.position_string).to eq '1 1 E'
  end
end

describe '#lost?' do
  it "returns true if robot status is lost" do
    robot = Robot.new(['1','1','E'])
    robot.status = ("LOST")
    expect(robot.lost?).to eq true
  end
end

describe '#coords' do
  it 'returns the coords of the robot' do
    robot = Robot.new(['1','1','E'])
    expect(robot.coords).to eq [1,1]
  end
end

describe '#turn' do
  it 'should turn left and right correctly' do
    robot = Robot.new(['1','1','W'])
    robot.turn('right')
    expect(robot.orientation).to eq 'N'
    robot.turn('left')
    expect(robot.orientation).to eq 'W'
  end
end

describe '#move_forward' do
  it 'should increase or decrease the x or y coordinate correctly depending on orienation' do
    mars = Mars.new(['5','3'])
    robot1 = Robot.new(['1','1','N'])
    robot2 = Robot.new(['1','1','S'])
    robot3 = Robot.new(['1','1','E'])
    robot4 = Robot.new(['1','1','W'])
    robot1.move_forward(mars)
    robot2.move_forward(mars)
    robot3.move_forward(mars)
    robot4.move_forward(mars)
    expect(robot1.coords).to eq [1,2]
    expect(robot2.coords).to eq [1,0]
    expect(robot3.coords).to eq [2,1]
    expect(robot4.coords).to eq [0,1]
  end
end


