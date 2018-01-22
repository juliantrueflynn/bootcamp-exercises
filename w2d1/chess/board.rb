require_relative "piece"

class Board
	def self.make_starting_grid
		empty_board = Array.new(2) { Array.new(8) { Piece.new } }
		empty_board += Array.new(4) { Array.new(8) { nil } }
		empty_board += Array.new(2) { Array.new(8) { Piece.new } }
	end

	attr_reader :grid

	def initialize
		@grid = Board.make_starting_grid
	end

	def [](pos)
		row, col = pos
		grid[row][col]
	end

	def []=(pos, value)
		row, col = pos
		grid[row][col] = value
	end

	def move_piece(start_pos, end_pos)
		start_row, start_col = start_pos
		end_row, end_col = end_pos

		raise ArgumentError.new("There's no piece in that spot!") if grid[start_row][start_col].nil?
		raise ArgumentError.new("That's not a spot on the board!") unless grid[end_row][end_col].nil?

		grid[end_row][end_col] = grid[start_row][start_col]
		grid[start_row][start_col] = nil
	end

	def self.in_bounds?(pos)
		row, col = pos
		row.between?(0, 7) && col.between?(0, 7)
	end
end
