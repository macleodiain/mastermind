class Mastermind
  require 'colorize'

  require_relative 'lib/code'
  require_relative 'lib/peg'

  def initialize
    @code = Code.new
    start_game
  end
    
  def start_game
    puts "Welcome to Mastermind"
    puts "The computer has devised a devilish code and you must try to crack it."
    puts "You must choose four colours each turn and will receive feedback showing how close your guess was"
    puts "Enter may choose yourguess from the options below:"
    puts "#{"R - Red".colorize(:red)} #{"G - Green".colorize(:green)} #{"B - Blue".colorize(:blue)} #{"Y - Yellow".colorize(:yellow)} #{"P - Pink".colorize(:magenta)} #{"O - Orange".colorize(:light_red)} "
    puts "E.G. If you want to choose Blue Blue Green Red, you would enter BBGY"
    #tracks how many turns you have had
    turn_counter = 0
    #if you hit 10 turns without guessing - you lose
    while turn_counter <=10
      #get the users guess - turn counter is passed to get guess so on the first turn it does not try to print the guess history
      guess = get_guess(turn_counter)
      # .check returns a hash with :black_flags and :white_flags as keys, numbers as values
      result = @code.check(guess)
      turn_counter +=1
      
      #if you get the code, you win and game ends
      if result[:black_flags] == 4
        puts "CODE CRACKED!  YOU WIN!"
        exit
      end
      #print out the flag info to inform their next guess
      puts "Black Flags:  #{result[:black_flags]}"
      puts "White Flags: #{result[:white_flags]}"
    end
    #If you dont get the code after ten turns you lose
    puts "GAME OVER - TOO MANY ATTEMPTS"
    puts "The code was #{@code.code.join}"
  end

  def get_guess(turn_counter)
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
    #clear the screen to get rid of clutter
    puts `clear`
    #dont print guess history on turn one (there is no guess history yet)
    if turn_counter > 0
      print_history(@code.history)
    end
    #show what the chosen guess was
    print "Your guess was:"
    @code.text_to_pegs(guess).each do |peg|
      print "#{peg} "
    end
    print "\n"
    @code.text_to_pegs(guess)
  end
  #print out the previous guesses
  def print_history(history)
    puts "Previous guesses /  results"
    history.each do |guess, result|
      puts "#{guess.join} - #{result}" 
    end
  end

end

g = Mastermind.new

