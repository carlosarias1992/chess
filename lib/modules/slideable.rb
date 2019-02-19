require 'byebug'

module Slideable
    DIRECTION_DIFFS = { 
        :horizontal => [[0, 1], [0,-1]], 
        :vertical => [[1,0], [-1, 0]],
        :diagonal => [[1, 1], [1,-1], [-1, 1], [-1,-1]], 
        :all => [[0, 1], [0,-1], [1,0], [-1, 0], [1, 1], [1,-1], [-1, 1], [-1,-1]]
    }.freeze

    def direction_diffs(direction)
        DIRECTION_DIFFS[direction]
    end 

    def moves(direction)
        direction_diffs(direction).each_with_object([]) do |(dx, dy), moves|
            current_pos = pos
            cur_x, cur_y = current_pos 

            loop do 
                cur_x, cur_y = cur_x + dx, cur_y + dy 
                current_pos = [cur_x, cur_y]

                if board.valid_move?(current_pos) && board.empty?(current_pos)
                    moves << [cur_x, cur_y]
                else 
                    break if !board.valid_move?(current_pos) || board[current_pos].color == color 
                    moves << [cur_x, cur_y]
                    break 
                end 
            end 
        end 
    end 
end 