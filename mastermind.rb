class Mastermind
  require_relative 'lib/standard_game'
  require_relative 'lib/codemaker_game'

  def initialize
    menu
  rescue Interrupt
    puts "\nExiting Game"
    exit
  end

  def menu
    puts 'Welcome to Mastermind'

    puts 'Choose option:'
    puts '1:  Play standard game vs computer'
    puts '2:  Play game as codemaker against computer'
    puts '3:  How to play'
    puts 'Enter ctrl + c at any time to quit'

    case gets.chomp
    when '1'
      StandardGame.new
    when '2'
      CodemakerGame.new
    when '3'
      info
    else
      puts 'invalid input - try again'
      menu
    end
  end

  def info
    puts 'How to play:'
    puts 'In a standard game, the computer will create a secret code and the user must try to guess that code.'
    puts 'Each time the user makes a guess, the computer will give you clues about how close your guess is in the form of Black and White flags'
    puts 'A black flag means one of your chosen colours is in the code and in the correct place.  i.e. if the code is RGBY and you guess ROOO you would get one black flag for the R as it is in the correct place'
    puts 'A white flag means one of your chosen colours is in the code but not in the right place ie.e if the code is RGBY and you guess OOOR you would get one white flag for the R as it is in the code but not in the correct place'
    puts 'The code and your guesses are always 4 characters.  Valid characters are RGBYOP, representing red green blue yellow orange and pink'
    puts 'You have ten turns to guess the code'
    puts "\n =========================================================================\n"
    puts 'In a codemaker game, you will choose the code and the computer will try to break it.  The same rules as above will apply'
    puts "\n"

    menu
  end
end

Mastermind.new
