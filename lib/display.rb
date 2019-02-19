require_relative 'board'
require_relative 'cursor'
require 'colorize'

class Display 
    attr_reader :board, :cursor
    attr_accessor :error_message

    def initialize(board)
        @board = board 
        @cursor = Cursor.new([0,0], board)
        @error_message = ""
    end 

    def render(player)
        top_index_line

        board.grid.each_with_index do |row, i|
            row_line = " #{i} "
            (0...row.length).each do |j|
                background_color = ((i - j) % 2) == 0 ? :blue : :light_blue
                background_color = cursor.cursor_pos == [i,j] ? :light_green : background_color
                row_line << " #{board[[i, j]].symbol} ".colorize(:background => background_color)
            end 
            puts row_line 
        end 

        puts error_message.colorize(:red)
        puts check_message(player)

        nil 
    end 

    def reset_error_message
        self.error_message = ""
    end 

    def get_cursor_input
        cursor.get_input
    end 

    private 

    def top_index_line
        top_line = "   "
        (0...8).each { |i| top_line << " #{i} " }
        puts top_line 
    end

    def check_message(player)
        "\nYou're in check!".colorize(:red) if player.check?
    end 
end 