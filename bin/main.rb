#!/usr/bin/env ruby

require_relative '../lib/game.rb'
require_relative '../lib/players.rb'

def display_invalid_choice 
    
  puts "\n\nINVALID CHOICE\n\n You can choose only EMPTY cells using letters & numbers: a1, a2, b3, c4, etc.\n\n"
  
end

first_game = Game.new
players = Players.new

puts "\nHello. Welcome to Tic Tac Toe first_game.\n\n Tell me your name..."
player1 = gets.chomp
players.toset_player(player1)
puts "\n Okey, #{player1}. Now tell me your opponent name..."
player2 = gets.chomp
players.toset_player(player2)
puts "\n Okey, #{player1} & #{player2}.Lets play...."
puts "\n\nRULES:\n\n"
puts 'First player starts with X, second with O.'
puts 'Players take turns in choosing one cell.'
puts 'You can choose empy cells a letter and num: a1, c4, etc.'
puts 'First one to do a succession of three wins (row, column or diagonal).'
puts "\n\nGAME ON! "

sleep 2.0

puts first_game.display_board


until first_game.check_result

  puts 'Mark your choice...'
  input_choice = gets.chomp.downcase
  if first_game.check_valid_choice?(input_choice)
  first_game.mark_choice(input_choice, first_game.counter)
  puts first_game.display_board
  first_game.toset_counter
  else
    display_invalid_choice
    sleep 2.0
   puts first_game.display_board
    
  end
  break if first_game.check_result == true

end
# rubocop:disable Metrics/LineLength

if first_game.result == :VICTORY

  first_game.check_winner
  puts first_game.display_board
  puts "\n\s\s\s\s!!!! Congrats #{first_game.winner == :X ? players.players[0] : players.players[1]}!"
  puts "\n\s\s\s\s     you WON. You truly are a WINNER !!!! \s\s\s\s\n"

end
# rubocop:enable Metrics/LineLength

if first_game.result == :DRAW
  puts first_game.display_board
  puts 'DRAW'

end