class Peg
  #require colorize for coloring the text
  require 'colorize'
  attr_accessor :colour, :position
  def initialize(t, p)
    #@text is the character representing the colour (ie R = Red)
    @text = t
    #position in the code (1st, 2nd, 3rd, 4th)
    @position = p 
  end

  def to_s
    #return coloured text
    @text.colorize(get_colour(@text))
  end
end

def get_colour(text)
  #figure out what colour to make the text
  case text 
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
end
