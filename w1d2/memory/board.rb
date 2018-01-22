require_relative("card")
require "pry"

class Board
	attr_reader :grid

	def initialize
		@grid = []
		@cards = []
	end

	def populate
		card_pairs = ("a".."h").to_a + ("a".."h").to_a

		@grid = Array.new(4) { Array.new(4) { nil } }
		@cards = Array.new(4) do
			Array.new(4) do
				card_face = card_pairs.sample
				Card.new(card_face)
				card_pairs.delete_at(card_pairs.index(card_face))
			end
		end
	end

	def [](pos)
		row, col = pos
		@grid[row][col]
	end

	def []=(pos, value)
		row, col = pos
		@grid[row][col] = value
	end

	def won?
		@grid.each do |row|
			return false unless row.all? { |col| col.nil? }
		end
		true
	end

	def render
		system("clear")
		p @grid
	end

	def reveal(guess)
		guess.reveal
		guess.to_s
	end
end
