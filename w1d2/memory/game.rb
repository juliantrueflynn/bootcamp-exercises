require_relative "card"
require_relative "board"

class Game
	def initialize
		@board = Board.new
		@previous_guess = nil
		@guess = nil
	end

	def make_guess
		puts "Guess position"
		guess = gets.chomp
		@guess = guess
	end

	def play
		@board.populate

		until @board.won?
			make_guess
			@board.render
		end
	end
end
