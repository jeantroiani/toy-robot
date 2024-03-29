describe Direction do
  let(:direction) { Direction.new(facing: 'NORTH') }

  context '#initialize' do
    it 'should be created with a valid direction' do
      expect(direction.to_s).to eq 'NORTH'
    end

    it 'first element of compass list should equal to the parameter passed in' do
      direction = Direction.new(facing: 'WEST')
      expect(direction.to_s).to eq 'WEST'
    end

    it 'returns an error if not valid direction' do
      expect{ Direction.new(facing: 'blue') }.to raise_error(RuntimeError)
    end
  end

  context '#turn' do
    it 'should change direction when turning right' do
      direction.turn 'right'
      expect(direction.to_s).to eq 'EAST'
    end

    it 'should change direction when turning left' do
      direction.turn 'left'
      expect(direction.to_s).to eq 'WEST'
    end
  end

  context '#to_a' do
    it 'should return an array of the direction' do
      expect(direction.to_a).to eq ['NORTH']
    end
  end

  context '#to_sym' do
    it 'should return the current direction as a symbol' do
      expect(direction.to_sym).to eq :NORTH
    end
  end
end