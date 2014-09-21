describe ToyRobot do
  let(:robot){ double :robot }
  let(:controller){ double :controller }
  let(:coordinate_class){ double :class }
  let(:direction_class){ double :class }
  let(:command_file){ 'commands.txt' }

  let(:toy_robot){ ToyRobot.new(robot, controller, coordinate_class, direction_class) }
  describe '#initialize' do
    it 'should be created with a robot object' do
      expect(toy_robot.robot).to eq robot
    end

    it 'should be created with a controller object' do
      expect(toy_robot.controller).to eq controller
    end

    it 'should be created with a coordinate class' do
      expect(toy_robot.coordinate_class).to eq coordinate_class
    end

    it 'should be created with a direction class' do
      expect(toy_robot.direction_class).to eq direction_class
    end
  end

  describe '#run' do
    it 'should tell the controller to process the file' do
      expect(controller).to receive(:process_commands).with(robot, command_file, coordinate_class, direction_class)
      toy_robot.run command_file
    end
  end
end