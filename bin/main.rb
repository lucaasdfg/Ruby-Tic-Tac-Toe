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

  def mark_choice(choice, counter)
    puts counter
    if counter == 1
      @turn = 'X'
    else
      @turn = 'O'
    end

    @board[choice.to_sym] = "X" if @turn == 'X' 
    @board[choice.to_sym] = "O" if @turn == 'O'
  end

  def display_board
    puts " a| #{@board[:a1]} | #{@board[:a2]} | #{@board[:a3]} \n b| #{@board[:b1]} | #{@board[:b2]} | #{@board[:b3]} \n c| #{@board[:c1]} | #{@board[:c2]} | #{@board[:c3]} |"
  end
end


first_game = Game.new
board = Board.new


  result = 'sometext'
  while result != 'victory' || result != 'draw'

  puts "Make your choice..."
  board.mark_choice(gets.chomp, first_game.counter)
  board.display_board
  first_game.counter == 1 ? first_game.counter=0 : first_game.counter=1
  end
  puts result

