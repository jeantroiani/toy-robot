describe Robot do
  let(:coordinate){ double :coordinate }


  context '#initialize' do
    it 'should be created with a coordinate' do
      robot = Robot.new(coordinate)
      expect(robot).to have_coordinate
    end
  end

  context '#get_coordinates' do
    
  end
end