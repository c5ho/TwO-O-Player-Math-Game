class Question
  attr_reader :num1, :num2

  #generate first and second num, and question text
  def initialize
    @num1 = rand(1..20)
    @num2 = rand(1..20)
    @sum = num1 + num2
    puts "What does #{num1} plus #{num2} equal?"
  end

  #method to check the correct answer
  def is_correct(answer)
    answer == @sum
  end
end