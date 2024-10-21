class Code

  require_relative 'peg'

  attr_accessor :code, :text_code, :history
  def initialize
    #text representation of code (array of indiviual letter strings ["R", "G", "B", "Y"])
    @text_code = create_code  
    #array of peg objects made from the above code.  Each peg has a text character and a position and a method ro return colourized version of the text character
    #@code = text_to_pegs(@text_code) #testing only uncomment for final
    @code = text_to_pegs(@text_code)
    @history = Hash.new
    
    
  end

  def create_code
    #generate a four character code from the below options
    colours = ["R", "G", "B", "Y", "P", "O"]
    text_code = []
    4.times do 
      text_code.push(colours[rand(0..5)])
    end
    #return the array of letters (the code)
    text_code
  end

  def text_to_pegs(text_code)
    #creates peg objects based on the code it is supplied
    #position is the position in the code, incremented by one after each peg is made
    position = 1
    code = []
    text_code.each do |letter|
      code.push (Peg.new(letter))
      position += 1
    end
    code
  end



  def check(user_guess)
    #results is a hash that stores the number of black_flags and white_flags
    results = Hash.new
    results.default = 0
    @code.each_with_index do |peg, index|
      #if text is equal you have a black flag (correct colour + correct position)
      if (peg.text == user_guess[index].text) 
        results[:black_flags] += 1
      #if the letter is not a black flag but does occur in the code you have a white flag
      elsif @text_code.include?(user_guess[index].text)
        results[:white_flags] += 1
      end
      #history is a hash to store previous guesses keys are previous guesses and values are results from those guesses
      @history[user_guess] = "B: #{results[:black_flags]} W: #{results[:white_flags]}"
    end
    #return the results showing how many black or white flags the user has
    results
  end

 
end




