describe Coordinate do
  let(:coordinate) { Coordinate.new(1,2) }
  context '#initialize' do
    it 'should be created with x and y coordinates' do
      expect(coordinate.x).to eq 1
      expect(coordinate.y).to eq 2
    end

    it 'should throw an error if out of bounds' do
      expect { Coordinate.new(0,5) }.to raise_error(RuntimeError)
    end
  end

  describe '#to_s' do
    it 'should display the coordainates' do
      expect(coordinate.to_s).to eq "1,2"
    end
  end

  context 'changing coordinates' do
    it 'should be able to set a new coordinate' do
      coordinate.x, coordinate.y = [1,3]
      expect(coordinate.x).to eq 1
      expect(coordinate.y).to eq 3
    end

    it 'should raise an error if x coordinate is out of bounds' do
      expect { coordinate.x = 5 }.to raise_error(RuntimeError)
    end

    it 'should raise an error if y coordinate is out of bounds' do
      expect { coordinate.y = 5 }.to raise_error(RuntimeError)
    end
  end

  describe '#move_towards' do
    let(:direction) { double :direction }
    it 'should ask for the direction' do
      allow(coordinate).to receive(:execute_change_on)
      expect(direction).to receive(:to_sym)
      coordinate.change_towards direction
    end

    context 'facing north' do
      it 'should move the robot +1 on the y-axis' do
        allow(direction).to receive(:to_sym).and_return(:NORTH)
        coordinate.change_towards direction
        expect(coordinate.to_a).to eq [1,3]
      end
    end

    context 'facing east' do
      it 'should move the robot +1 on the x-axis' do
        allow(direction).to receive(:to_sym).and_return(:EAST)
        coordinate.change_towards direction
        expect(coordinate.to_a).to eq [2,2]
      end
    end

    context 'facing south' do
      it 'should move the robot -1 on the y-axis' do
        allow(direction).to receive(:to_sym).and_return(:SOUTH)
        coordinate.change_towards direction
        expect(coordinate.to_a).to eq [1,1]
      end
    end

    context 'facing west' do
      it 'should move the robot -1 on the x-axis' do
        allow(direction).to receive(:to_sym).and_return(:WEST)
        coordinate.change_towards direction
        expect(coordinate.to_a).to eq [0,2]
      end
    end
  end

  describe '#to_a' do
    it 'should return an array of x and y coordinate' do
      expect(coordinate.to_a).to eq [1,2]
    end
  end

end