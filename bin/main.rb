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
  def initialize
    @board = {a1: "", a2: "", a3: "", b1: "", b2:"", b3:"", c1: "", c2: "", c3:""}
    @turn = "X"
  end

  def mark_choice(choice)
    if @counter == 1
      @turn == 'X'
    else
      @turn == 'O'
    end

    @board[choice] = "X" if @turn == 'X' 
    @board[choice] = "O" if @turn == 'O'
  end

  def display_board
    puts "#{@board[:a1]} | #{@board[:a2]} | #{@board[:a3]} \n | #{@board[:b1]} | #{@board[:b2]} | #{@board[:b3]} \n | #{@board[:c1]} | #{@board[:c2]} | #{@board[:c3]} |"
  end
end

board = Board.new
start = Game.new
start

puts "put your choice.."
board.mark_choice(gets.chomp.to_sym)
puts board.display_board


