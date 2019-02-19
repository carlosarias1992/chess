class Piece
    attr_accessor :valid_moves, :pos
    attr_reader :color, :board, :symbol

    def initialize(pos, board, color = nil)
        @pos = pos 
        @valid_moves = []
        @color = color  
        @board = board 
    end 

    def inspect 
        self.class
    end 

    def empty?
        false 
    end 
end 