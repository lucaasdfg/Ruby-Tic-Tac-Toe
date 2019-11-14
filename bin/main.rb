#!/usr/bin/env ruby

$board = { a1: '', a2: '', a3: '', b1: '', b2: '', b3: '', c1: '', c2: '', c3: '' }
$contador = 0
$result = ''
$counter = 1
$players = []
$turn = 'X'
$playing = true
def mark_choice(choice)
  
  $turn = $counter == 1 ? 'X' : 'O'
  $counter = $counter == 1 ? $counter = 0 : $counter = 1
  $board[choice.to_sym] = 'X' if $turn == 'X'
  $board[choice.to_sym] = 'O' if $turn == 'O'
  $contador += 1
  
end

def display_board
  puts "--------------------------\n\s\s\s\s a|\s #{$board[:a1]}\s |\s #{$board[:a2]}\s |\s #{$board[:a3]}\s |\n\s\s\s\s b|\s #{$board[:b1]}\s |\s #{$board[:b2]}\s |\s #{$board[:b3]}\s |\n\s\s\s\s c|\s #{$board[:c1]}\s |\s #{$board[:c2]}\s |\s #{$board[:c3]}\s | \n--------------------------"
end

  
def check_valid_choice?(arg)
   choice_dict = %w[a1 a2 a3 b1 b2 b3 c1 c2 c3]

    return true if choice_dict.include?(arg) && $board[arg.to_sym] == ''

    puts "\n\nINVALID CHOICE\n\n You can choose only EMPTY cells using letters & and numbers: a1, a2, b3, c4, etc.\n\n"
    sleep 2.0
    display_board
end

def check_victory
  winning_patterns = [[$board[:a1], $board[:a2], $board[:a3]], [$board[:b1], $board[:b2], $board[:b3]], [$board[:c1], $board[:c2], $board[:c3]], [$board[:a1], $board[:b1], $board[:c1]], [$board[:a2], $board[:b2], $board[:c2]], [$board[:a3], $board[:b3], $board[:c3]], [$board[:a1], $board[:b2], $board[:c3]], [$board[:a3], $board[:b2], $board[:c1]]]
  winning_patterns.each do |item|
    next unless (item[0] == item[1]) && (item[1] == item[2]) && (item[2] == item[0]) && (item[0] != '')

    $result = 'victory'
    $playing = false
  end
  $result = 'draw' if $contador == 9
  $playing = false if $contador == 9
end

# welcome users to game and asks for names

puts "\nHello. Welcome to Tic Tac Toe Game.\n\n Tell me your name..."
player1 = gets.chomp
$players << $player1
puts "\n Okey, #{player1}. Now tell me your opponent name..."
player2 = gets.chomp
$players << $player2


puts "\n Okey, #{$player1} & #{$player2}.Lets play...."
puts "\n\nRULES:\n\n"
puts 'First player starts with X, second with O.'
puts 'Players take turns in choosing one cell.'
puts 'You can choose empy cells a letter and num: a1, c4, etc.'
puts 'First one to do a succession of three wins (row, column or diagonal).'
puts "\n\nGAME ON! "
# use sleep to create time on user interface changes
sleep 2.0


# keep on while if 'playing ' is true

while $playing 
  display_board
  puts 'Mark your choice...'
  input_choice = gets.chomp.downcase

  #here use a  'next unless' to check if choice is valid
  #if valid, mark_choice(input_choice)

  next unless check_valid_choice?(input_choice)
  mark_choice(input_choice)
  check_victory
  
  # check victory and exits when playing is false
  # set playing to false inside victory

end



if $result == 'victory'


  # display winner 

  puts "\n\s\s\s\s!!!! Congrats WINNER-NAME you WON. You are truly a WINNER !!!! \s\s\s\s\n"

end
if $result == 'draw'
  # display draw
  puts 'DRAW!'
  
end