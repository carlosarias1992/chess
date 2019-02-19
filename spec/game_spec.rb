require 'rspec'
require 'game'

describe Game do 
    subject(:game) { Game.new(player_1, player_2, display) }
    let(:player_1) { Player.new('Carlos') }
    let(:player_2) { Player.new('Ariel') }
    let(:display) { Display.new(board)}
    let(:board) { Board.new }

    context '#initialize' do 
        it 'should instantiate an instance variable for display' do 
            expect(game.display).to be_a(Display)
        end 

        it 'should set player_1 and player_2' do 
            expect(game.player_1.name).to eq('Carlos')
            expect(game.player_2.name).to eq('Ariel')
        end 

        it 'should assign a color to player_1 and player_2' do 
            colors = [:white, :black]
            expect(colors).to include(game.player_1.color)
        end 

        it 'should instantiate a current_player variable' do 
            players = [player_1, player_2]
            expect(players).to include(game.current_player)
        end 
    end 

    context '#switch_players' do 
        it 'should switch the value of current_player' do 
            old_player = game.current_player
            game.switch_players
            expect(game.current_player).to_not eq(old_player)
        end 
    end 

    context '#won?' do 
        it 'should return true if game is over'

        it 'should return false if game is not over'
    end 

    context '#play' do 
        it 'should render the chess board'

        it 'should run until game is over'
    end 

    context '#assign_color' do 
        it 'should assign a color to each player' do 
            colors = [:white, :black]
            expect(colors).to include(game.player_1.color)

            colors.delete(game.player_1.color)
            expect(colors).to eq(game.player_2.color)
        end

        it 'should not assign the same color to both players' do 
            expect(game.player_1.color).to_not eq(game.player_2.color)
        end 
    end 
end 