class Player 
  attr_accessor :lives, :name
  @@max_lives = 3

  def initialize(name)
    @name = name
    @lives = 3;
    puts "Player #{name} initialized with #{lives} lives."
  end

  def self.max_lives
    @@max_lives  
  end


  def decrement
    @lives -= 1
  end
end