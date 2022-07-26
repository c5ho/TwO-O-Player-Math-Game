class Player 
  attr_accessor :lives, :name

  def initialize(name)
    @name = name
    @lives = 3;
    puts "Player #{name} initialized with #{lives} lives."
  end

  def decrement
    @lives -= 1
  end
end