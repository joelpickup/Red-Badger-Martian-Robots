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