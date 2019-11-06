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

  attr_reader :result
  def initialize
    @board = {a1: "", a2: "", a3: "", b1: "", b2:"", b3:"", c1: "", c2: "", c3:""}
    @turn = "X"
    @result = ""
  end

  def mark_choice(choice, counter)
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
    puts "#{item[0]}"
    puts @result
    if (item[0] == item[1]) && (item[1] == item[2]) && (item[2] == item[0]) && (item[0] != "")
      @result = "victory"
    end
    }

  end
  def check_draw

  end

  def check_valid_choice?(arg)
    choice_dict = ["a1", "a2"]
    
    if choice_dict.include?(arg)
      return true
    else
      puts "make a valid choice"
    end


  end


end

=begin

1) check valid choice, if true, mark choice on "board" if not, ask  for choice
2) everytime a valid choice is marked on board, increment "some counter" by one
3) if "some counter" is equal to 9, and there are no winner, declare a "draw"


=end

first_game = Game.new
board = Board.new



while board.result != "victory" || board.result != "draw"


puts "Mark your choice..."

valid_choice = gets.chomp
if board.check_valid_choice?(gets.chomp)
  board.mark_choice(valid_choice, first_game.counter)
  break if board.result == "victory" || board.result == "draw"
  board.display_board
  first_game.counter == 1 ? first_game.counter=0 : first_game.counter=1 
end

if board.result == "victory"
  puts "victory"

  board.display_board
end
end
