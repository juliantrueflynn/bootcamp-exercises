require_relative "piece"

class Board
  attr_reader :rows

  def initialize(fill_board = true)
    @sentinel = nil
    make_starting_grid(fill_board)
  end

  def [](pos)
    row, col = pos
    @rows[row][col]
  end

  def []=(pos, value)
    row, col = pos
    @rows[row][col] = value
  end

  def move_piece(start_pos, end_pos)
    piece = self[start_pos]

    #raise ArgumentError.new("There's no piece in that spot!") if piece.moves.include?(end_pos)
    #raise ArgumentError.new("That's not a spot on the board!") unless
    
    move_piece!(start_pos, end_pos)
  end

  def move_piece!(start_pos, end_pos)
    piece = self[start_pos]

    self[end_pos] = piece
    self[start_pos] = nil
    
    nil
  end

  def self.in_bounds?(pos)
    row, col = pos
    row.between?(0, 7) && col.between?(0, 7)
  end

  private

  attr_reader :sentinel

  def make_starting_grid(fill_board)
    empty_board = Array.new(2) { Array.new(8) { Piece.new } }
    empty_board += Array.new(4) { Array.new(8) { nil } }
    empty_board += Array.new(2) { Array.new(8) { Piece.new } }
    empty_board
  end
end