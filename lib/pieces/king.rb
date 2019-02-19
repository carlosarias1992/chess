require_relative '../modules/steppable'

class King < Piece 
    include Steppable 

    def initialize(pos, board, color)
        @symbol = "♚".colorize(color) 
        super
    end

    def move_dirs
        valid_moves.concat(moves(:king))
    end 
end 