#!/usr/bin/env ruby
class Game
  puts "your turn..."
  def initialize
    puts "Tell me your name..."
    @player1 = gets.chomp
    puts "And your opponent name..."
    @player2 = gets.chomp
    @counter = 1
    puts "put your choice.."
    @choice = gets.chomp
    puts board.display_board
    board.mark_choice(@choice)
    puts board.display_board
  end
end

class Board
  def initialize
    @board = {a1: "", a2: "", a3: "", b1: "", b2:"", b3:"", c1: "", c2: "", c3:""}
    @turn = ""
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
    puts "#{@board}"
  end
end

board = Board.new
start = Game.new
start


