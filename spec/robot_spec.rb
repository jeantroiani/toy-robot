describe Robot do
  let(:coordinate) { double :coordinate, to_a: [1,2] }
  let(:direction) { double :direction, to_a: ["NORTH"] }
  let(:coordinate_class) { double :class, new: coordinate }
  let(:direction_class) { double :class, new: direction }
  let(:robot){ Robot.new(coordinate_class, direction_class) }

  context '#initialize' do
    it 'should not be placed when created' do
      expect(robot).not_to be_placed
    end

    it 'should have a coordinate class' do
      expect(robot.coordinate_class).to eq coordinate_class
    end

    it 'should have a direction_class' do
      expect(robot.direction_class).to eq direction_class
    end
  end

  context 'that is not placed' do
    describe '#place' do
      it 'should send a new message to the coordinate class' do
        expect(coordinate_class).to receive(:new)
        robot.place 1, 2, 'NORTH'
      end

      it 'should send a new message to the direction class' do
        expect(direction_class).to receive(:new)
        robot.place 1, 2, 'NORTH'
      end

      it 'can be placed' do
        robot.place 1, 2, 'NORTH'
        expect(robot).to be_placed
      end
    end

    it 'should raise an error if asked to turn left' do
      expect{ robot.left }.to raise_error(RuntimeError)
    end

    it 'should raise an error if asked to turn left' do
      expect{ robot.right }.to raise_error(RuntimeError)
    end

    it 'should raise an error if asked to move' do
      expect{ robot.move }.to raise_error(RuntimeError)
    end

    it 'should raise an error if asked to report' do
      expect{ robot.report }.to raise_error(RuntimeError)
    end
  end

  context 'that is placed' do

    before do
      robot.place 1, 2, 'NORTH'
    end

    context '#report' do
      before do
        allow(robot).to receive(:puts)
      end
      it 'asks for its location' do
        expect(coordinate).to receive(:to_a)
        robot.report
      end

      it 'asks for its direction' do
        expect(direction).to receive(:to_a)
        robot.report
      end

      it 'returns its current location and direction' do
        expect(robot).to receive(:puts).with("1,2,NORTH")
        robot.report
      end
    end

    context '#left' do
      it 'should tell the direction object to turn left' do
        expect(direction).to receive(:turn).with('left')
        robot.left
      end
    end

    context '#right' do
      it 'should tell the direction object to turn right' do
        expect(direction).to receive(:turn).with('right')
        robot.right
      end      
    end

    context '#move' do
      it 'should tell the coordinate to change_position_towards the direction' do
        expect(coordinate).to receive(:change_position_towards).with(direction)
        robot.move
      end
    end
  end

end