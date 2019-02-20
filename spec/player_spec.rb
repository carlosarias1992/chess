require 'rspec'
require 'player'

describe Player do 
    subject(:player) { Player.new('Carlos', board) }
    let(:board) { Board.new }

    context '#initialize' do 
        it 'should instantiate an instance variable of name' do 
            expect(player.name).to eq('Carlos')
        end 

        it 'should set an instance variable of the chess board' do 
            expect(player.board).to be_a(Board)
        end 

        it 'should set a color variable and set it to nil' do 
            expect(player.color).to be_nil 
        end 

        it 'should begin with no collected pieces' do 
            expect(player.collected_pieces).to be_empty 
        end 
    end 

    context '#checkmate?' do 
        it 'should return true if player is in checkmate' do 
            player.color = :white 
            
            board.move_piece([1,6], [3,6])
            board.move_piece([6,4], [4,3])
            board.move_piece([1,5], [2,5])
            board.move_piece([7,3], [3,7])

            expect(player.checkmate?).to be true 
        end 

        it 'should return false if the enemy player is in checkmate, but not the current player' do 
            player.color = :black
            
            board.move_piece([1,6], [3,6])
            board.move_piece([6,4], [4,3])
            board.move_piece([1,5], [2,5])
            board.move_piece([7,3], [3,7])

            expect(player.checkmate?).to be false 
        end 

        it 'should return false if current player is not in checkmate' do 
            player.color = :black
            
            board.move_piece([1,6], [3,6])
            board.move_piece([6,4], [4,3])
            board.move_piece([1,5], [2,5])
            board.move_piece([7,3], [3,6])

            expect(player.checkmate?).to be false 
        end 
    end 
end 