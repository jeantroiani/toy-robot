describe Robot do
  let(:robot){ Robot.new }

  context '#initialize' do
    it 'should not be placed when created' do
      expect(robot).not_to be_placed
    end
  end

  context 'that is not placed' do
    it 'can be placed at a coordinate' do
      coordinate = double :coordinate
      robot.place_at coordinate
      expect(robot).to be_placed
    end
  end

  context 'that is placed' do
    let(:coordinate) { double :coordinate, to_a: [1,2] }
    before do
      robot.place_at coordinate
    end

    context '#status' do
      it 'asks for its location' do
        expect(coordinate).to receive(:to_a)
        robot.status
      end

      it 'returns its current location' do
        expect(robot.status).to eq [1,2]
      end
    end
  end

end