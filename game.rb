class Game
  attr_reader :player1, :player2

  # Initialize 2 players
  def initialize
    @player1 = Player.new("Player 1")
    @player2 = Player.new("Player 2")
    @current_player = player1
  end
  
  # Output the winner
  def output_winner(winner)
    puts "#{winner.name} wins with a score of #{winner.lives}/#{Player.max_lives}!"
    puts "----------GAME OVER----------"
    exit(0)
  end

  # Get new question
  def get_question
    print "#{@current_player.name}: "
    @question = Question.new
  end

  # Get response and check if it's correct
  def get_response
    print ">"
    @response = $stdin.gets.chomp.to_i
    if @question.is_correct(@response.to_i)
      puts "#{@current_player.name}: YES! You are correct!"
    else
      puts "#{@current_player.name}: Seriously?  No!"
      @current_player.decrement
    end
  end
  
  def output_stats
    puts "P1: #{player1.lives}/#{Player.max_lives} vs P2: #{player2.lives}/#{Player.max_lives}\n\n"
  end

  def prep_next_turn
    puts "----------NEW TURN----------"
    if @current_player == player1 
      @current_player = player2
    elsif @current_player == player2
      @current_player = player1
    end
  end

  def next_turn
    get_question
    get_response    
    output_stats

    if player1.lives == 0
      output_winner(player2)
    elsif player2.lives ==0
      output_winner(player1)
    end
    
    prep_next_turn
    next_turn
  end
  
   def start
    next_turn
  end
end
