# frozen_string_literal: true

class Board
  attr_accessor :board
  def initialize
    @board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  end

  def board_update(input, index)
    board[index] = input
  end

  def board_reader(position)
    board[position]
  end
end
