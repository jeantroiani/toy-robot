describe Controller do
  let(:controller){ Controller.new }

  describe '#initialize' do
    it 'should be created with no commands' do
      expect(controller.commands).to be_empty
    end
  end

  describe '#process' do
    let(:robot) { double :robot }

    context 'commands with no arguments' do
      it 'should send a move message to the robot' do
        allow(File).to receive(:open).and_return(['MOVE'])
        expect(robot).to receive(:move)
        controller.process 'commands.txt', robot
      end

      it 'should send a left message to the robot' do
        allow(File).to receive(:open).and_return(['LEFT'])
        expect(robot).to receive(:left)
        controller.process 'commands.txt', robot
      end

      it 'should send a right message to the robot' do
        allow(File).to receive(:open).and_return(['RIGHT'])
        expect(robot).to receive(:right)
        controller.process 'commands.txt', robot
      end

      it 'should send a report message to the robot' do
        allow(File).to receive(:open).and_return(['REPORT'])
        expect(robot).to receive(:report)
        controller.process 'commands.txt', robot
      end
    end

    context 'commands with arguments' do
      before do
        allow(File).to receive(:open).and_return(['PLACE 0,0,NORTH']) 
        allow(robot).to receive(:place) 
      end

      it 'should send a place message to the robot with coordinate and direction objects' do
        expect(robot).to receive(:place).with(0, 0, 'NORTH')
        controller.process 'commands.txt', robot
      end
    end

    context 'invalid commands' do
      it 'should display the error message' do
        allow(File).to receive(:open).and_return(['CRAP'])
        allow(robot).to receive(:crap).and_raise('Name error')
        expect(controller).to receive(:puts).with('Name error')
        controller.process 'commands.txt', robot
      end
    end
  end
end