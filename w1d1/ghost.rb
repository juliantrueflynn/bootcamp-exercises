class Game
	def initialize(players, fragment = "", dictionary = nil)
		@players = players
		@fragment = fragment
		@dictionary = dictionary || File.readlines("dictionary.txt")
		@player1 = players[:player1]
		@computer = players[:player2]
		@current_player = @player1
	end

	def current_player
		@current_player
	end

	def next_player!
		if @current_player == @player1
			@current_player = @computer
		else
			@current_player = @player1
		end
	end

	def take_turn(player)
		player.guess
	end

	def valid_play?(string)
		@dictionary.each { |word| return true if /^"#{string}"/.match?(word) }
		true unless @dictionary.any? { |current_word| current_word == string }
	end

	def play_round
		while true
			guess = take_turn(@current_player)
			if valid_play?(guess)
				@fragment << guess
				break
			end
		end
		p @fragment
		next_player!
	end

	def run
		while true
			play_round
		end
	end
end

class Player
	attr_reader :name

	def initialize(name)
		@name = name
	end

	def guess
		puts "Guess?"
		player_guess = gets.chomp
		player_guess
	end

	def alert_invalid_guess
	end
end

class Computer
	attr_reader :name

	def initialize(name)
		@name = name
	end

	def guess
	end

	def alert_invalid_guess
	end
end

if __FILE__ == $PROGRAM_NAME
	players = {
		player1: Player.new("Human"),
		player2: Player.new("Human2")
	}
	game = Game.new(players, "ab")

	game.play_round
end
