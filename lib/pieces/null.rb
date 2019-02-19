require "singleton"

class NullPiece < Piece 
    include Singleton

    def initialize
        @symbol = " "
    end 

    def empty?
        true 
    end 
end 