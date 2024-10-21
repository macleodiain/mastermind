class Peg
  #require colorize for coloring the text
  require 'colorize'
  attr_accessor :text
  def initialize(t)
    #@text is the character representing the colour (ie R = Red)
    @text = t
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
