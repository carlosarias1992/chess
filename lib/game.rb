require_relative 'display'
require_relative 'player'

class Game 
    attr_reader :player_1, :player_2, :display
    attr_accessor :current_player

    def initialize(player_1, player_2, display)
        @player_1, @player_2, @display = player_1, player_2, display
        @current_player = [player_1, player_2].shuffle.first
        assign_color 
    end 

    def assign_color
        players = [player_1, player_2]
        current_player.color = :white 
        players.delete(current_player)
        players.first.color = :black 
    end 

    def switch_players 
        players = [player_1, player_2]
        players.delete(current_player)
        self.current_player = players.first
    end 

    def details_for(player)
        puts "\nIt's #{current_player.name}'s turn."
        puts "Your color is #{current_player.color}!"
        
        unless current_player.collected_pieces.empty? 
            puts "Collected pieces: #{current_player.collected_pieces.colorize(:green)}"
        end 
    end 

    def get_move
        move = []

        until move.length == 2
            system("clear")
            display.render(current_player)
            display.reset_error_message 
            details_for(current_player)
            input = display.get_cursor_input
            move << input unless input.nil?
        end 

        move 
    end 

    def turn 
        begin 
            move = get_move 
            current_player.move_piece(move.first, move.last)
            switch_players
            system("clear")
            display.render(current_player)
        rescue InvalidMoveError
            display.error_message = "\nInvalid move!"
            retry 
        end 
    end 

    def play 
        until current_player.checkmate?
            turn 
        end 
    end 
end 

if __FILE__ == $PROGRAM_NAME 
    board = Board.new
    display = Display.new(board)

    system("clear")
    puts "Enter player1's name"
    player1_name = gets.chomp

    puts "\nEnter player2's name"
    player2_name = gets.chomp 

    player1 = Player.new(player1_name, board)
    player2 = Player.new(player2_name, board)

    game = Game.new(player1, player2, display)
    game.play 
end 