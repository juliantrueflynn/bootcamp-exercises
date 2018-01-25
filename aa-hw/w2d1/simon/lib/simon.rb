class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
		@sequence_length = 1
		@game_over = false
    @seq = []
    @players_seq = []
  end

  def play
    until game_over
      take_turn
      system("clear")
    end

    game_over_message
    reset_game
  end

  def take_turn
    show_sequence
    require_sequence
    
    unless game_over
      round_success_message
      @sequence_length += 1
    end
  end

  def show_sequence
    add_random_color
    
    seq.each do |color|
      puts color
      sleep 1
      system("clear")
      sleep 0.75 
    end
  end

  def require_sequence
    puts "Put colors from sequence in order. Press enter after each color."
    players_seq = []
    seq.each do |color|
      user_color = gets.chomp

      unless user_color == color
        @game_over = true
        break
      end
    end
    sleep 0.25
  end

  def add_random_color
		@seq << COLORS.shuffle[0]
  end

  def round_success_message
    puts "LEVEL PASSED!"
  end

  def game_over_message
    puts "GAME OVER!"
  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
  end
end

if __FILE__ == $PROGRAM_NAME
  Simon.new.play
end