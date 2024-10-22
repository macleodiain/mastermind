class Code
  attr_accessor :code
  def initialize(user_selected_code = [])
    #allowing for second game mode where the user chooses the code
    if user_selected_code.empty?
      @code = create_code
    else 
      @code = user_selected_code
    end
  end

  def create_code
    #generate a four character code from the below options
    allowed_characters = ["R", "G", "B", "Y", "P", "O"]
    code = []
    4.times do 
      code.push(allowed_characters[rand(0..5)])
    end
    #return the array of letters (the code)
    code
  end

  def check(user_guess)
     #results is a hash that stores the number of black_flags and white_flags
     results = Hash.new
     results.default = 0
      @code.each_with_index do |letter, index|
       #if text is equal you have a black flag (correct colour + correct position)
       if (letter == user_guess[index]) 
         results[:black_flags] += 1
       #if the letter is not a black flag but does occur in the code you have a white flag
       elsif @code.join.include?(user_guess[index])
         results[:white_flags] += 1
       end
       #history is a hash to store previous guesses keys are previous guesses and values are results from those guesses
      #  @history[user_guess] = "B: #{results[:black_flags]} W: #{results[:white_flags]}" DEBUGGING
     end
     #return the results showing how many black or white flags the user has
     results
  end
end