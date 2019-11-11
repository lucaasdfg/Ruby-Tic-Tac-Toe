#!/usr/bin/env ruby

board = ''
result = ''

# welcome users to game and asks for names

puts "\nHello. Welcome to Tic Tac Toe Game.\n\n Tell me your name..."
player_1 = gets.chomp
puts "\n Okey, #{player_1}. Now tell me your opponent name..."
player_2 = gets.chomp
puts "\n Okey, #{player_1} & #{player_2}. {Some explanation on how to play goes here...a}Lets play.... "

# use sleep to create time on user interface changes
sleep 2.0

#  here display empy board : board

# keep on while if 'result' is different from victory or draw, exits when get some of them
while result != 'victory' || result != 'draw'

  puts 'Mark your choice...'
  input_choice = gets.chomp.downcase

  #here use a  'next unless' to check if choice is valid
  #if valid, mark_choice(input_choice)

  puts board

  #  break if board == 'victory' || board == 'draw'

end


if result == 'victory'


  #display board, display winner 

  puts "\n\s\s\s\s!!!! Congrats WINNER-NAME you WON. You are truly a WINNER !!!! \s\s\s\s\n"

end
if result == 'draw'
  #display board, display draw
  
end