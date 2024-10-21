class Mastermind
  require 'colorize'

  require_relative 'lib/code'
  require_relative 'lib/peg'

  def initialize
    @code = Code.new
 
  end
    
  def start_game
    puts "Welcome to Mastermind"
    puts "The computer has devised a devilish code and you must try to crack it."
    puts "You must choose four colours each turn and will receive feedback showing how close your guess was"
    puts "Enter may choose yourguess from the options below:"
    puts "#{"R - Red".colorize(:red)} #{"G - Green".colorize(:green)} #{"B - Blue".colorize(:blue)} #{"Y - Yellow".colorize(:yellow)} #{"P - Pink".colorize(:magenta)} #{"O - Orange".colorize(:light_red)} "
    puts "E.G. If you want to choose Blue Blue Green Red, you would enter BBGY"
    user_guess
  end

  def user_guess
    puts "Please enter your guess"
    continue = false
    guess = ""
    while continue == false
       colours = ["R", "G", "B", "Y", "P", "O"]
      check_count = 0
      guess = gets.chomp.upcase.split("")
      guess.each do |letter|
        if colours.any?{|colour| colour == letter}
          check_count +=1
        end
      end
      if check_count == 4  
        continue = true
      else
       puts "Your code was #{guess.join}"
       puts "This is an invalid code"
      end
    end
    guess.join
  end

end

g = Mastermind.new

p = Peg.new