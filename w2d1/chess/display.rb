require "colorize"
require_relative "cursor"
require_relative "board"

class Display
	attr_reader :board

	def initialize
		@board = Board.new
		@cursor = Cursor.new([0,0], @board)
	end
end
