require 'byebug'

module Steppable
    DIRECTION_DIFFS = { 
        :king => [[0, 1],[0,-1],[1,0],[1,-1],[-1,0],[-1,-1],[-1,1],[1,1]], 
        :knight => [[2,1],[1,2],[1,-2],[-1,2],[-1,-2],[-2,1],[2,-1],[-2,-1]]
    }.freeze

    def direction_diffs(direction)
        DIRECTION_DIFFS[direction]
    end 

    def moves(direction)
        direction_diffs(direction).each_with_object([]) do |(dx, dy), moves|
            cur_x, cur_y = pos 
            next_x, next_y = cur_x + dx, cur_y + dy
            next_pos = [next_x, next_y] 

            moves << next_pos if board.valid_move?(next_pos) && board[next_pos].color != color 
        end 
    end 
end 