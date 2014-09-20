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
      robot.place_at coordinate, direction
      expect(robot).to be_placed
    end

  end

  context 'that is placed' do
    let(:coordinate) { double :coordinate, to_a: [1,2] }
    let(:direction) { double :direction, to_a: ["NORTH"] }
    before do
      robot.place_at coordinate, direction
    end

    context '#status' do
      it 'asks for its location' do
        expect(coordinate).to receive(:to_a)
        robot.status
      end

      it 'asks for its direction' do
        expect(direction).to receive(:to_a)
        robot.status
      end

      it 'returns its current location and direction' do
        expect(robot.status).to eq [1,2, "NORTH"]
      end
    end
  end

end