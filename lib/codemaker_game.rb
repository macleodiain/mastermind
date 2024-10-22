require_relative 'standard_game'
class CodemakerGame < StandardGame
  
  def initialize
    @game_type = "codemaker"
     run_game
    exit
  end

  def run_game
    puts "You are the Code Maker!  Enter your code and the computer will try to crack it!"
    #get_guess is inherited from standard game.  Returns an code in the form of an array ie ["R", "G", "B", "Y"]
    @code = Code.new(get_guess)
    turn_counter = 1
    previous_turns = []
    while turn_counter <= 10
      #thinking is a method put in to slow down the computer so each turn takes a few seconds
      thinking
      #clear previous guess/history
      puts `clear`
      #create_code is the method that generates a random code in the standard game
      guess = @code.create_code
      result = @code.check(guess)
      
      if result[:black_flags] == 4
        #if you have 4 black flags, the computer has guessed your code and you lose
        previous_turns << save_turn(turn_counter, guess, result)
        game_end("lose", previous_turns)
      elsif turn_counter == 10
        #after ten turns the compuet loses if it hasnt guessed correctly
        previous_turns << save_turn(turn_counter, guess, result)
        game_end("win", previous_turns)
      end
      #add each turn info to the previous turn array
      previous_turns << save_turn(turn_counter, guess, result)
      print_previous_turns(previous_turns)
      turn_counter += 1
    end


  end

  def thinking 
    puts "The computer is thinking"
    8.times do
      sleep(0.1)
      print "."
    end
  end
end

# a = CodemakerGame.new
