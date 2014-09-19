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

  context '#to_s' do
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

end