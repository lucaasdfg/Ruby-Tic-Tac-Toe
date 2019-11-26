require_relative '../lib/game.rb'

describe Game do
    let(:first_game) { Game.new }
    let(:empty_board) do
      [['', '', ''], ['', '', ''], ['', '', ''], ['', '', ''], ['', '', ''], ['', '', ''], ['', '', ''], ['', '', '']]
    end
  
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

      it 'it should keep contador variable without being modified, as it is' do
        first_game.contador = 3
        first_game.check_valid_choice?('asada2')
        expect(first_game.contador).to be 3
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
  
    describe '#check_victory' do
      it 'return empty array when cells in board are empty' do
        expect(first_game.check_victory).to eql(empty_board)
      end
      it 'when contador = 9  changes result to draw' do
        first_game.contador = 9
        first_game.check_victory
        expect(first_game.result).to eql(:DRAW)
      end
      it 'changes resut variable to victory when finds a winning patern' do
        first_game.board = { a1: :X, a2: :X, a3: :X }
        first_game.check_victory
        expect(first_game.result).to eql(:VICTORY)
      end
    end
    describe '#check_winner keeps track of @winner equal to turn ' do
      it 'check winner is eql to :X in first turn' do
        winner = first_game.turn
        expect(winner).to eql(:X)
      end
      it '#check winner is eql to :O on second turn' do
        first_game.toset_counter
        first_game.mark_choice("b1", 0)
        first_game.check_winner
        winner = first_game.turn
        expect(winner).to eql(:O)
      end
    end
  end
  