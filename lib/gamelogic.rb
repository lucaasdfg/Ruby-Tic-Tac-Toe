# frozen_string_literal: true

# rubocop:disable Metrics/LineLength
# rubocop:disable Metrics/CyclomaticComplexity
class Game
  attr_accessor :players
  def initialize
    @players = []
  end

  def toset_player(player)
    @players << player
  end
end

class Board
  attr_accessor :counter
  attr_reader :result, :contador, :winner

  def initialize
    @board = { a1: '', a2: '', a3: '', b1: '', b2: '', b3: '', c1: '', c2: '', c3: '' }
    @turn = 'X'
    @result = ''
    @contador = 0
    @winner = ''
    @counter = 1
  end

  def mark_choice(choice, _counter)
    @contador += 1
    @turn = @counter == 1 ? 'X' : 'O'
    @board[choice.to_sym] = 'X' if @turn == 'X'
    @board[choice.to_sym] = 'O' if @turn == 'O'
    check_victory
  end

  def display_board
    "--------------------------\n\s\s\s\s a|\s #{@board[:a1]}\s |\s #{@board[:a2]}\s |\s #{@board[:a3]}\s |\n\s\s\s\s b|\s #{@board[:b1]}\s |\s #{@board[:b2]}\s |\s #{@board[:b3]}\s |\n\s\s\s\s c|\s #{@board[:c1]}\s |\s #{@board[:c2]}\s |\s #{@board[:c3]}\s | \n--------------------------"
  end

  def check_victory
    winning_patterns = [[@board[:a1], @board[:a2], @board[:a3]], [@board[:b1], @board[:b2], @board[:b3]], [@board[:c1], @board[:c2], @board[:c3]], [@board[:a1], @board[:b1], @board[:c1]], [@board[:a2], @board[:b2], @board[:c2]], [@board[:a3], @board[:b3], @board[:c3]], [@board[:a1], @board[:b2], @board[:c3]], [@board[:a3], @board[:b2], @board[:c1]]]
    winning_patterns.each do |item|
      next unless (item[0] == item[1]) && (item[1] == item[2]) && (item[2] == item[0]) && (item[0] != '')

      @result = 'victory'
    end
    @result = @result != 'victory' ? 'draw' : 'victory' if @contador == 9
  end

  def check_valid_choice?(arg)
    choice_dict = %w[a1 a2 a3 b1 b2 b3 c1 c2 c3]

    return true if choice_dict.include?(arg) && @board[arg.to_sym] == ''

    display_invalid_choice
  end

  def check_winner
    @winner = @turn
  end

  def check_result
    return true if @result == 'victory' || @result == 'draw'
    return false if @result != 'victory' || @result != 'draw'
  end

  def toset_counter
    @counter = (@counter == 1 ? 0 : 1)
  end
end
# rubocop:enable Metrics/LineLength
# rubocop:enable Metrics/CyclomaticComplexity
