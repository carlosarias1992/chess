require_relative 'board'
require 'byebug'

class Player
    attr_accessor :color, :collected_pieces 
    attr_reader :name, :board

    def initialize(name, board)
        @name, @color, @board = name, nil, board 
        @collected_pieces = ""
    end 

    def move_piece(start_pos, end_pos)
        raise InvalidMoveError if board[start_pos].empty? 
        
        unless board[start_pos].move_dirs.include?(end_pos) && board[start_pos].color == color
            raise InvalidMoveError 
        end 
        
        unless board.empty?(end_pos)
            self.collected_pieces += board[end_pos].symbol unless board[end_pos].color == color
        end 

        board.move_piece(start_pos, end_pos) 
    end 

    def check?
        enemy_moves.include?(king_pos)
    end 

    def check_mate?
        board[king_pos].move_dirs.none? { |move| enemy_moves.include?(move) }
    end 

    private 

    def king_pos 
        king_position = []

        board.grid.each do |row| 
            king_piece = row.find { |piece| piece.is_a?(King) && color == piece.color } 

            unless king_piece.nil? 
                king_position = king_piece.pos
                break 
            end 
        end 

        king_position.uniq
    end 

    def enemy_moves
        moves = []

        board.grid.each_with_index do |row, i|
            row.each_with_index do |piece, j|
                unless board.empty?([i, j])
                    available_moves = piece.move_dirs
                    moves.concat(available_moves) unless color == piece.color
                end 
            end 
        end 

        moves.uniq
    end 
end 