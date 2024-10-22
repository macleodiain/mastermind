class StandardGame
  require 'colorize'
  require_relative 'code'
  require_relative 'turn'

  def initialize
    #creates a code object which generates the code to break and has logic for checking guesses against code
    @code = Code.new
    puts `clear`
    puts "The code has been set!  Good luck!\n\n"
    #this method controls game flow
    
      run_game
    
    
    
  end

  def run_game
    
    #previous turns stores your previous guesses and the results from them.  Is an array of Turn objects
    previous_turns = []
    #keeps track of what turn it is
    turn_counter = 1
    #game loop starts
    continue = true
    while continue
      #get guess from user
      guess = get_guess
      #clear the screen
      puts `clear`
      puts "Your guess was #{color(guess)}"
      #check the guess against the code
      result = @code.check(guess)
      #4 black flags means all colours are in the correct place
      if result[:black_flags] == 4
        #end the game as a win
        game_end("win", previous_turns)
      elsif turn_counter == 10
        #lose game if you hit ten turns before you figure it out
        game_end("lose", previous_turns)
      end
      #add the guess and its results to the previous turns array - save_turn resturns a Turn object
      previous_turns << save_turn(turn_counter, guess, result)
      #print out previous turns so you can see what your previous guesses were
      print_previous_turns(previous_turns)
      turn_counter += 1
    end
    

  end

  def get_guess
    #gets and validates user input
    puts "Please enter your guess:"
    continue = false
    guess = ""
    while continue == false
      allowed_characters = ["R", "G", "B", "Y", "P", "O"]
      check_count = 0
      guess = gets.chomp.upcase.split("")
      #if all letters supplied are in the allowed characters list it is a valid guess
      if guess.all?{|letter|allowed_characters.include?(letter)}
        if guess.length > 4
          #added this as i noticed entering an allowed character more than four times would pass the above check
          #i.e RGBYRGBYRGBYRGBY is all valid characters. Only the first four characters are taken
          guess = guess[0..3]
        end
        continue = true
      else
          #If you enter an invalid string
          puts "Your code was #{guess.join}"
          puts "This is an invalid code"
      end
    end
    #return guess.  An array of single charater strings representing the colours chosen.
    guess
  end

  def color(text)
    #takes an array of characters (guess) and colourises each one then returns a colorised string
    output_string = ""
    
    text.each do |letter|
      color_code = case letter
        when "R"
         :red
       when "G"
         :green
       when "B"
         :blue
       when "Y"
          :yellow
        when "P"
          :magenta
        when "O"
          :light_red
        end
      output_string += letter.colorize(color_code)
    end
    output_string
  end

  def save_turn(turn_counter, guess, result)
    #saves previous turn information
    black_flags = result[:black_flags]
    white_flags = result[:white_flags]
    Turn.new(turn_counter, guess, black_flags, white_flags)
  end

  def print_previous_turns(previous_turns)
    #prints an supplied array of turn objects 
    previous_turns.each do |turn|
      puts turn
    end
  end

  def game_end(wincon, history)
    #win or lose end game
    if wincon == "win"
      puts "Congratulations, you broke the code!"
    else
      puts "Unlucky, you ran out of turns"
    end
    puts "The code was #{color(@code.code)}"
    print_history(history)
    exit
  end
    


      
end


# a = StandardGame.new