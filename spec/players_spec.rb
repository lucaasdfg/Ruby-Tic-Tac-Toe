
require_relative '../lib/players.rb'

describe Players do
    let(:players) { Players.new }
  
    describe '#toset_player' do
      it 'when you call tosetplayer changes players array to include name' do
        players.toset_player('lucas')
        testcase = players.players.include?('lucas') ? true : false
        expect(testcase).to be true
      end
      it 'return false when player is not included in players array' do
        players.toset_player('lucas')
        testcase = players.players.include?('alex') ? true : false
        expect(testcase).to be false
      end
    end
  
    describe '#initialize' do
      it 'when you create object it starts with empty players array' do
        expect(players.players).to eql([])
      end

      it 'adding players modifies the initial empty array' do
        players.toset_player('alex')
        expect(players.players).to_not eql([])
      end
    end
  end
  