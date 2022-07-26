class Game
  attr_reader :player1, :player2

  #initialize 2 players, start game
  def initialize
    @player1 = Player.new("Player 1")
    @player2 = Player.new("Player 2")
  end
  
  # Get new question
  def next_turn
    print "#{@current_player.name}: "
    @question = Question.new
    
    # Prompt for and get response
    print ">"
    @response = $stdin.gets.chomp.to_i
    if @question.is_correct(@response.to_i)
      puts "#{@current_player.name}: YES! You are correct!"
    else
      puts "#{@current_player.name}: Seriously?  No!"
      @current_player.decrement
    end
    puts "P1: #{player1.lives}/3 vs P2: #{player2.lives}/3\n\n"
        
    if player1.lives == 0
      puts "#{player2.name} wins with a score of #{player2.lives}/3!"
      puts "----------GAME OVER----------"
      exit(0)
    elsif player2.lives ==0
      puts "#{player1.name} wins with a score of #{player1.lives}/3!"
      puts "----------GAME OVER----------"
      exit(0)
    end
    puts "----------NEW TURN----------"
    if @current_player = player1 
      @current_player = player2
    elsif @current_player = player2
      @current_player = player1
    end
    next_turn
  end
  
   def start
    @current_player = player1
    next_turn
  end
end
