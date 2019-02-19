require_relative 'piece'
require_relative '../modules/slideable'

class Bishop < Piece 
    include Slideable 

    def initialize(pos, board, color)
        @symbol = "♝".colorize(color) 
        super
    end

    def move_dirs
        valid_moves.concat(moves(:diagonal))
    end 
end