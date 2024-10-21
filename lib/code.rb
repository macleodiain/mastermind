class Code

  require_relative 'peg'

  attr_accessor :code, :text_code
  def initialize
    #text representation of code (array of indiviual letter strings ["R", "G", "B", "Y"])
    @text_code = create_code
    #array of peg objects made from the above code.  Each peg has a text character and a position and a method ro return colourized version of the text character
    @code = text_to_pegs(@text_code)
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
      code.push (Peg.new(letter, position))
      position += 1
    end
    code
  end
end

