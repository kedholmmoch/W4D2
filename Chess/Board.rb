require_relative './Piece.rb'

class Board
attr_reader :grid

  def initialize(size=8)
    @grid = Array.new(size) { Array.new(size) }
  end

  def [](pos)
    row, col = pos
    grid[row][col]
  end

  def []=(pos, val)
     row, col = pos
    grid[row][col] = val
  end

  def set_board
    skip_rows = [2, 3, 4, 5]
    @grid.each_with_index do |row, row_idx|
      next if skip_rows.include?(row_idx)
      row.each_with_index do |col, col_idx|
        @grid[row_idx][col_idx] = Piece.new
      end
    end
  end

  def move_piece(start_pos, end_pos)
    if !pos_occupied?(start_pos) 
      raise "The square is empty!"
    end 

    # if !valid_move?(pos)
    #   raise "That is not a valid move!"
    # end

    self[end_pos] = self[start_pos]
    self[start_pos] = nil
  end

  def pos_occupied?(pos)
    return false if self[pos] == nil
    true
  end

  def valid_move?(pos)

  end
  
end

board = Board.new
board.set_board

puts "---------"

p board[[1,7]]
p board[[3,7]]
puts "---------"
board.move_piece([1,7], [3,7])
p board[[1,7]]
p board[[3,7]]
puts "---------"
p board