# I didn't know how to mock the += and -= operator so I am using the Chicago Style TDD for
# testing the move operation

describe 'Moving the robot' do
  let(:robot) { Robot.new }
  let(:coordinate) { Coordinate.new(1,1) }
  let(:direction) { double :direction }

  before do
    robot.place coordinate, direction
  end

  it 'should ask for the direction' do
    expect(direction).to receive(:to_s)
    robot.move
  end

  it 'should raise an error if robot is not placed' do
    new_robot = Robot.new
    expect{ new_robot.move }.to raise_error(RuntimeError)
  end

  context 'and facing north' do
    it 'should move the robot +1 on the y-axis' do
      allow(direction).to receive(:to_s).and_return('NORTH')
      allow(direction).to receive(:to_a).and_return(['NORTH'])
      robot.move
      expect(robot.status).to eq [1,2,'NORTH']
    end
  end

  context 'and facing west' do
    it 'should move the robot -1 on the x-axis' do
      allow(direction).to receive(:to_s).and_return('WEST')
      allow(direction).to receive(:to_a).and_return(['WEST'])
      robot.move
      expect(robot.status).to eq [0,1,'WEST']
    end
  end

  context 'and facing south' do
    it 'should move the robot -1 on the y-axis' do
      allow(direction).to receive(:to_s).and_return('SOUTH')
      allow(direction).to receive(:to_a).and_return(['SOUTH'])
      robot.move
      expect(robot.status).to eq [1,0,'SOUTH']
    end 
  end
  context 'and facing east' do
    it 'should move the robot +1 on the x-axis' do
      allow(direction).to receive(:to_s).and_return('EAST')
      allow(direction).to receive(:to_a).and_return(['EAST'])
      robot.move
      expect(robot.status).to eq [2,1,'EAST']
    end 
  end
end