require_relative '../modules/steppable'

class Knight < Piece 
    include Steppable

    def initialize(pos, board, color)
        @symbol = "♞".colorize(color) 
        super
    end

    def move_dirs
        valid_moves.concat(moves(:knight))
    end 
end 