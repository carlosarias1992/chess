require 'byebug'

class Pawn < Piece 

    DIRECTIONAL_DIFFS = { 
        :black => [[-1,0], [-1,1], [-1,-1]],
        :white => [[1,0], [1,1], [1,-1]],
        :first_move_black => [[-1,0], [-1,1], [-1,-1], [-2,0]],
        :first_move_white => [[1,0], [1,1], [1,-1], [2,0]]
        }.freeze

    def initialize(pos, board, color)
        @symbol = "♟".colorize(color) 
        super
    end 

    def directional_diffs(color)
        DIRECTIONAL_DIFFS[color]
    end 

    def move_dirs 
        piece_color = assign_color

        directional_diffs(piece_color).each_with_object([]) do |(dx, dy), moves|
            cur_x, cur_y = pos 
            next_pos = [cur_x + dx, cur_y + dy]

            if board.valid_move?(next_pos)
                if board.empty?(next_pos)
                    next unless dy.zero?
                    moves << next_pos
                else 
                    next if dy.zero?
                    moves << next_pos unless board[next_pos].nil? || board[next_pos].color == color 
                end 
            end 
        end 
    end 

    private 

    def assign_color
        case pos.first 
        when 1
            if color == :white 
                piece_color = ("first_move_" + color.to_s).to_sym 
            else 
                piece_color = color 
            end 
        when 6
            if color == :black
                piece_color = ("first_move_" + color.to_s).to_sym 
            else 
                piece_color = color 
            end 
        else 
            piece_color = color 
        end 
    end 
end 