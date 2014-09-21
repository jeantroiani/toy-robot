describe Controller do
  let(:controller){ Controller.new }
  context '#initialize' do
    it 'should be created with no commands' do
      expect(controller.commands).to be_empty
    end
  end

  context '#read_file' do
    it 'should read file and add commands to the commands array' do
      controller.read_file('commands.txt')
      expect(controller.commands).not_to be_empty
    end
  end
end