require 'rspec'
require 'pieces/pawn'

describe Pawn do 
    subject(:pawn) { board[[1,1]] }
    let(:board) { Board.new }

    context '#initialize' do 
        it 'sets an instance variable of position' do 
            expect(pawn.pos).to eq([1,1])
        end 

        it 'sets an instance variable of color' do 
            expect(pawn.color).to eq(:white)
        end 

        it 'sets an instance variable of the chess board' do 
            expect(pawn.board).to eq(board)
        end 

        it 'assigns a symbol' do 
            expect(pawn.symbol).to_not be_empty
        end 
    end

    context '#move_dirs' do 
        it 'only moves forward if no enemy piece is diagonal' do 
            board.move_piece([1,3], [4,4]) 
            possible_moves = [[5, 4]]
            pawn = board[[4,4]]

            expect(pawn.move_dirs).to eq(possible_moves)
        end 
        
        it 'moves diagonally if an enemy piece is diagonal to the pawn' do 
            board.move_piece([1,1], [5,4]) 
            possible_moves = [[6, 3],[6,5]]
            pawn = board[[5,4]]

            expect(board[[5,4]].move_dirs).to eq([[6,5],[6, 3]])
        end 

        it 'returns an empty array when there are no available moves' do 
            board.move_piece([1,3], [4,4]) 
            board.move_piece([1,4], [5,4]) 
            pawn = board[[4,4]]

            expect(pawn.move_dirs).to be_empty
        end
    end 
end 