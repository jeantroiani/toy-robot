describe ToyRobot do
  let(:robot){ double :robot }
  let(:controller){ double :controller }
  let(:command_file){ 'commands.txt' }

  let(:toy_robot){ ToyRobot.new(robot, controller) }
  describe '#initialize' do
    it 'should be created with a robot object' do
      expect(toy_robot.robot).to eq robot
    end

    it 'should be created with a controller object' do
      expect(toy_robot.controller).to eq controller
    end

  end

  describe '#run' do
    it 'should tell the controller to process the file' do
      expect(controller).to receive(:process).with(command_file, robot)
      toy_robot.run command_file
    end
  end
end