require_relative 'game'
require_relative 'computer'
require_relative 'person'

def print_game_selection_menu
  puts "Let's play Mastermind!"
  puts "\nWould you like to be the code MAKER or the code BREAKER?\nPress '1' to be the code MAKER\nPress '2' to be the code BREAKER"
end

def start_game
  print_game_selection_menu
  user_input = gets.chomp
  puts
 if user_input == "1"
   Game.new(Computer.new, Person.new).play_game
   ask_to_play_again
 elsif user_input == "2"
   Game.new.play_game
   ask_to_play_again
 else
   puts "That's an invalid response."
   start_game
 end
end

def quit_game
  puts 'Thank you for playing Mastermind!'
  exit
end

def ask_to_play_again
  puts 'Do you want to play again? (Y/N)'
  user_input = gets.chomp.downcase
  puts
  if %w[y yes].include?(user_input)
    start_game
  elsif %w[n no].include?(user_input)
    quit_game
  else
    puts "That's an invalid response."
    ask_to_play_again
  end
end

start_game