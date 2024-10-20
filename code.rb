class Code

  attr_accessor :code
  def initialize
    @code = create_code
  end

  def create_code
    colours = ["R", "G", "B", "Y", "P", "O"]
    code = []
    4.times do
      # code.push(colours.delete_at(rand(0..(colours.length - 1))))  
      code.push(colours[rand(0..5)])
    end

    code
  end
end