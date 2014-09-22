describe FileParser do
  describe '#parse' do
    it 'should send a open message to the File class' do
      allow(FileParser).to receive(:split_into_methods_and_params_for)
      allow(FileParser).to receive(:parse_params_for)
      expect(File).to receive(:open).and_return(['MOVE'])
      FileParser.parse 'commands.txt'
    end

    context 'command without parameters' do
      it 'should return a nil parameters array' do
        allow(File).to receive(:open).and_return(['MOVE'])
        expect(FileParser.parse('commands.txt')).to eq [['MOVE',nil]]
      end
    end

    context 'command with parameters' do
      it 'should return a parameters array' do
        allow(File).to receive(:open).and_return(['PLACE 0,0,NORTH'])
        expect(FileParser.parse('commands.txt')).to eq [["PLACE", [0, 0, "NORTH"]]]
      end
    end
  end
end