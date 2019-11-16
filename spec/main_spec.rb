require_relative '../lib/game.rb'
require_relative '../lib/players.rb'

describe Game do
  let(:first_game) { Game.new }
  let(:empty_board) { [["", "", ""], ["", "", ""], ["", "", ""], ["", "", ""], ["", "", ""], ["", "", ""], ["", "", ""], ["", "", ""]]
 }

  context 'test initialize values of object with class first_game' do
    it 'starts turn with X' do
      expect(first_game.turn).to eq(:X)
    end

    it 'starts counter with 1' do
      expect(first_game.counter).to eq(1)
    end

    it "starts 'result' with empty strings" do
      expect(first_game.result).to eq('')
    end

    it 'class of created object is equal to Game' do
      expect(first_game.class).to eq(Game)
    end
  end

  describe '#check_valid_choice?' do
    it 'should return different to true when no valid choice is given' do
      expect(first_game.check_valid_choice?('aisdad')).not_to be true
    end

    it 'should return true when valid choice is given' do
      expect(first_game.check_valid_choice?('a2')).to be true
    end
  end

  describe '#mark_choice' do
   
    it 'raise error when no parameter is given' do
      expect { first_game.mark_choice }.to raise_error(ArgumentError)
    end

    it 'add choice to @first_game when there is a valid choice' do
      first_game.mark_choice('b2', 2)
      expect(first_game.board[:b2]).to eq(:X)
    end

    it "should increment 'contador' by one when a valid choice is given" do
      first_game.mark_choice('b2', first_game.contador)
      expect(first_game.contador).to eq(1)
    end
  end

  describe "#check_victory" do 
    it "return empty array when cells in board are empty" do
      expect(first_game.check_victory).to eql(empty_board)
    end
    it "when contador = 9  changes result to draw" do
      first_game.contador = 9
      first_game.check_victory
      expect(first_game.result).to eql(:DRAW)
    end
    it "changes resut variable to victory when finds a winning patern" do
      first_game.board = {a1: :X, a2: :X, a3: :X}
      first_game.check_victory 
      expect(first_game.result).to eql(:VICTORY)
      
    end
end
describe "#check_winner" do
    it "check winner es igual a turn cuando llamas al metodo check winner la variable winner es igual a turn"  do
     winner = first_game.check_winner
     expect(winner).to eql(:X)
  end

end
end




describe Players do
let(:players) { Players.new }

describe "#toset_player" do
    it "cuando llamas a toset player en la variable player el argumento que se pasa" do
     players.toset_player("lucas")
     testcase = players.players.include?("lucas") ? true : false
     expect(testcase).to be true
end
end

describe "#initialize" do
  it  "cuando creas un nuevo objeto con la clase game una variable players que es igual empty array" do
   expect(players.players).to eql([])
end

end
end