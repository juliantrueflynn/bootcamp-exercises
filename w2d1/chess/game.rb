require_relative "board"
require_relative "display"

class Game
  attr_reader :board, :display
  def initialize
    @board = Board.new
    @display = Display.new(@board)
  end
end

if __FILE__ == $PROGRAM_NAME
  Game.new.display.render
end