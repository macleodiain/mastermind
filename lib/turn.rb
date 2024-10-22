class Turn
  #stores information about a turn
  #turn number,what the guess was, how many black/white flags there were
  require 'colorize'
  def initialize(turn_counter, guess, bf, wf)
    @turn = turn_counter
    @guess = guess
    @black_flags = bf
    @white_flags = wf
  end

  def to_s
    # will return something like > Turn 0: RGBY(colored) B: 1 W: 2
    "Turn: #{@turn}:  #{color(@guess)}  B: #{@black_flags}  W: #{@white_flags}"
  end

  def color(text)
    #colors each letter in a guess
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


end