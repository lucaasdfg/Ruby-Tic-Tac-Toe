#!/usr/bin/env ruby

class Game
  attr_accessor :players
  def initialize
    @players = []
  end

  def set_player(player)
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
    puts "--------------------------\n\s\s\s\s a|\s #{@board[:a1]}\s |\s #{@board[:a2]}\s |\s #{@board[:a3]}\s |\n\s\s\s\s b|\s #{@board[:b1]}\s |\s #{@board[:b2]}\s |\s #{@board[:b3]}\s |\n\s\s\s\s c|\s #{@board[:c1]}\s |\s #{@board[:c2]}\s |\s #{@board[:c3]}\s | \n--------------------------"
  end

  def check_victory
    winning_patterns = [[@board[:a1], @board[:a2], @board[:a3]], [@board[:b1], @board[:b2], @board[:b3]], [@board[:c1], @board[:c2], @board[:c3]], [@board[:a1], @board[:b1], @board[:c1]], [@board[:a2], @board[:b2], @board[:c2]], [@board[:a3], @board[:b3], @board[:c3]], [@board[:a1], @board[:b2], @board[:c3]], [@board[:a3], @board[:b2], @board[:c1]]]
    winning_patterns.each do |item|
      if (item[0] == item[1]) && (item[1] == item[2]) && (item[2] == item[0]) && (item[0] != '')
        @result = 'victory'
      end
    end
    @result = 'draw' if @contador == 9
  end

  def check_valid_choice?(arg)
    choice_dict = %w[a1 a2 a3 b1 b2 b3 c1 c2 c3]

    if choice_dict.include?(arg) && @board[arg.to_sym] == ''
      return true
    else
      puts 'invalid choice'
    end
  end

  def check_winner
    @winner = @turn
  end
end



first_game = Game.new
board = Board.new

puts "\nHello. Welcome to Tic Tac Toe Game.\n\n Tell me your name..."
player_1 = gets.chomp
first_game.set_player(player_1)
puts "\n Okey, #{player_1}. Now tell me your opponent name..."
player_2 = gets.chomp
first_game.set_player(player_2)
puts "\n Okey, #{player_1} & #{player_2}. In this Tic Tac Toe we write the letter a-b-c for the rows and 1-2-3 for the columns so first row, first column equals==a1, good luck"

sleep 2.0

board.display_board

while board.result != 'victory' || board.result != 'draw'

  puts 'Mark your choice...'
  input_choice = gets.chomp.downcase
  next unless board.check_valid_choice?(input_choice)
  board.mark_choice(input_choice, board.counter)
  board.display_board
  board.counter = (board.counter == 1 ? 0 : 1)
  break if board.result == 'victory' || board.result == 'draw'

end
if board.result == 'victory'
  board.check_winner
  board.display_board

  puts "\n\s\s\s\s!!!! Congrats #{board.winner == 'X' ? first_game.players[0] : first_game.players[1]}! you WON. You are truly a WINNER !!!! \s\s\s\s\n"

end
if board.result == 'draw'
  board.display_board
  puts 'draw'

end
