describe Controller do
  let(:controller){ Controller.new }
  let(:coordinate) { double :coordinate}
  let(:direction) { double :direction}
  let(:coordinate_class) { double :class, new: coordinate }
  let(:direction_class) { double :class, new: direction }

  describe '#initialize' do
    it 'should be created with no commands' do
      expect(controller.commands).to be_empty
    end
  end

  describe '#perform_action' do
    let(:robot) { double :robot }

    context 'commands with no arguments' do
      it 'should send a move message to the robot' do
        allow(File).to receive(:open).and_return(['MOVE'])
        expect(robot).to receive(:move)
        controller.perform_action robot, 'commands.txt', coordinate_class, direction_class
      end

      it 'should send a left message to the robot' do
        allow(File).to receive(:open).and_return(['LEFT'])
        expect(robot).to receive(:left)
        controller.perform_action robot, 'commands.txt', coordinate_class, direction_class
      end

      it 'should send a right message to the robot' do
        allow(File).to receive(:open).and_return(['RIGHT'])
        expect(robot).to receive(:right)
        controller.perform_action robot, 'commands.txt', coordinate_class, direction_class
      end

      it 'should send a report message to the robot' do
        allow(File).to receive(:open).and_return(['REPORT'])
        expect(robot).to receive(:report)
        controller.perform_action robot, 'commands.txt', coordinate_class, direction_class
      end
    end

    context 'commands with arguments' do
      before do
        allow(File).to receive(:open).and_return(['PLACE 0,0,NORTH']) 
        allow(robot).to receive(:place) 
      end

      it 'should send a message to the coordinate class' do
        expect(coordinate_class).to receive(:new)
        controller.perform_action robot, 'commands.txt', coordinate_class, direction_class
      end

      it 'should send a message to the direction class' do
        expect(direction_class).to receive(:new)
        controller.perform_action robot, 'commands.txt', coordinate_class, direction_class
      end

      it 'should send a place message to the robot with coordinate and direction objects' do
        expect(robot).to receive(:place).with(coordinate, direction)
        controller.perform_action robot, 'commands.txt', coordinate_class, direction_class
      end
    end
    
  end
end