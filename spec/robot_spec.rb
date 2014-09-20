describe Robot do
  let(:robot){ Robot.new }

  context '#initialize' do
    it 'should not be placed when created' do
      expect(robot).not_to be_placed
    end
  end

  context 'that is not placed' do
    it 'can be placed at a coordinate and direction' do
      coordinate = double :coordinate
      direction = double :direction
      robot.place coordinate, direction
      expect(robot).to be_placed
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
    let(:coordinate) { double :coordinate, to_a: [1,2] }
    let(:direction) { double :direction, to_a: ["NORTH"] }
    before do
      robot.place coordinate, direction
    end

    context '#report' do
      it 'asks for its location' do
        expect(coordinate).to receive(:to_a)
        robot.report
      end

      it 'asks for its direction' do
        expect(direction).to receive(:to_a)
        robot.report
      end

      it 'returns its current location and direction' do
        expect(robot.report).to eq "1,2,NORTH"
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
      it 'should tell the coordinate to change_towards the direction' do
        expect(coordinate).to receive(:change_towards).with(direction)
        robot.move
      end
    end
  end

end