#!/usr/bin/env ruby

require_relative '../lib/gamelogic.rb'
first_game = Game.new
board = Board.new

puts "\nHello. Welcome to Tic Tac Toe Game.\n\n Tell me your name..."
player1 = gets.chomp
first_game.toset_player(player1)
puts "\n Okey, #{player1}. Now tell me your opponent name..."
player2 = gets.chomp
first_game.toset_player(player2)
puts "\n Okey, #{player1} & #{player2}.Lets play...."
puts "\n\nRULES:\n\n"
puts 'First player starts with X, second with O.'
puts 'Players take turns in choosing one cell.'
puts 'You can choose empy cells a letter and num: a1, c4, etc.'
puts 'First one to do a succession of three wins (row, column or diagonal).'
puts "\n\nGAME ON! "

sleep 2.0

board.display_board

# while board.result != 'victory' || board.result != 'draw'

until board.check_result

  puts 'Mark your choice...'
  input_choice = gets.chomp.downcase
  next unless board.check_valid_choice?(input_choice)
  board.mark_choice(input_choice, board.counter)
  board.display_board
  board.toset_counter
  break if board.check_result == true

end
# rubocop:disable Metrics/LineLength

if board.result == 'victory'

  board.check_winner
  board.display_board
  puts "\n\s\s\s\s!!!! Congrats #{board.winner == 'X' ? first_game.players[0] : first_game.players[1]}!"
  puts "\n\s\s\s\s     you WON. You are truly a WINNER !!!! \s\s\s\s\n"

end
# rubocop:enable Metrics/LineLength

if board.result == 'draw'
  board.display_board
  puts 'DRAW'

end
