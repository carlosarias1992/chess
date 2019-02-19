class Queen < Piece 
    include Slideable 
    
    def initialize(pos, board, color)
        @symbol = "♛".colorize(color) 
        super
    end

    def move_dirs
        valid_moves.concat(moves(:all))
    end 
end