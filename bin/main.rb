#!/usr/bin/env ruby

class Game
  attr_accessor :counter
  puts "your turn..."
  def initialize
    puts "Tell me your name..."
    @player1 = gets.chomp
    puts "And your opponent name..."
    @player2 = gets.chomp
    @counter = 1

  end
end

class Board

  attr_reader :result, :contador
  def initialize
    @board = {a1: "", a2: "", a3: "", b1: "", b2:"", b3:"", c1: "", c2: "", c3:""}
    @turn = "X"
    @result = ""
    @contador = 0
  end

  def mark_choice(choice, counter)
    @contador += 1
    counter == 1 ? @turn = "X" : @turn = "O"
    @board[choice.to_sym] = "X" if @turn == 'X'
    @board[choice.to_sym] = "O" if @turn == 'O'
    self.check_victory
  end

  def display_board
    puts " a| #{@board[:a1]} | #{@board[:a2]} | #{@board[:a3]} \n b| #{@board[:b1]} | #{@board[:b2]} | #{@board[:b3]} \n c| #{@board[:c1]} | #{@board[:c2]} | #{@board[:c3]} |"
  end

  def check_victory

    arr = [[@board[:a1], @board[:a2], @board[:a3]],[@board[:b1],@board[:b2],@board[:b3]],[@board[:c1],@board[:c2],@board[:c3]],[@board[:a1], @board[:b1], @board[:c1]], [@board[:a2], @board[:b2], @board[:c2]], [@board[:a3], @board[:b3], @board[:c3]], [@board[:a1], @board[:b2], @board[:c3]], [@board[:a3], @board[:b2], @board[:c1]]]
    arr.each{ |item|
    
    if (item[0] == item[1]) && (item[1] == item[2]) && (item[2] == item[0]) && (item[0] != "")
      @result = "victory"
    end
    }
    if @contador == 9
      @result = "draw"
    end
  end
  def check_valid_choice?(arg)
    choice_dict = ["a1", "a2","a3", "b1", "b2", "b3", "c1", "c2", "c3"]
    
    if choice_dict.include?(arg) && @board[arg.to_sym] == ""
      return true
    else
      puts "invalid choice"
    end
  end
end

=begin

1) que se vea mejor el board
2) mejorar las frases
3)

=end

first_game = Game.new
board = Board.new



while board.result != "victory" || board.result != "draw"


puts "Mark your choice..."
algo = gets.chomp
if board.check_valid_choice?(algo)
  board.mark_choice(algo, first_game.counter)
  break if board.result == "victory" || board.result == "draw"
  board.display_board
  first_game.counter == 1 ? first_game.counter=0 : first_game.counter=1 

end


end
if board.result == "victory"
  board.display_board

  puts "victory"

end
if board.result == "draw"
  board.display_board
  puts "draw"

end