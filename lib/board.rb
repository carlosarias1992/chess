require_relative "pieces"
require "colorize"

class InvalidMoveError < StandardError; end 

class Board 
    attr_accessor :grid

    def initialize
        @grid = Array.new(8) { Array.new(8) }
        populate 
    end 

    def [](pos)
        row, col = pos 
        grid[row][col]
    end 

    def []=(pos, value)
        row, col = pos 
        grid[row][col] = value 
    end 

    def empty?(pos)
        return true if self[pos].is_a?(NullPiece)
        false 
    end 

    def move_piece(start_pos, end_pos)
        if valid_move?(start_pos) && valid_move?(end_pos)
            if empty?(end_pos) && self[end_pos].color != self[start_pos].color 
                self[start_pos], self[end_pos] = self[end_pos], self[start_pos]
            else 
                self[start_pos], self[end_pos] = NullPiece.instance, self[start_pos]
            end 

            self[end_pos].pos = end_pos
        else 
            raise InvalidMoveError 
        end 
    end 

    def valid_move?(pos)
        pos.none? { |coordinate| coordinate < 0 || coordinate > 7 }
    end 

    private

    def populate
        (0...8).each do |i| 
            (0...8).each { |j| self[[i, j]] = NullPiece.instance }
        end 

        pieces = [ Rook, Knight, Bishop, Queen, King, Bishop, Knight, Rook ]
        
        [:white, :black].each do |color|
            row = color == :white ? 0 : 7 
            pawn_row = color == :white ? 1 : 6 

            8.times do |col|
                pos = [row, col]
                pawn_pos = [pawn_row, col]

                self[pos] = pieces[col].new(pos, self, color)
                self[pawn_pos] = Pawn.new(pawn_pos, self, color)
            end 
        end 
    end 
end 
