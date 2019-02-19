require 'rspec'
require 'pieces/rook'

describe Rook do 
    subject(:rook) { board[[0,0]] }
    let(:board) { Board.new }

    context '#initialize' do 
        it 'sets an instance variable of position' do 
            expect(rook.pos).to eq([0,0])
        end 

        it 'sets an instance variable of color' do 
            expect(rook.color).to eq(:white)
        end 

        it 'sets an instance variable of the chess board' do 
            expect(rook.board).to eq(board)
        end 

        it 'assigns a symbol' do 
            expect(rook.symbol).to_not be_empty
        end 
    end

    context '#move_dirs' do 
        it 'returns all possible moves for this piece' do 
            board.move_piece([0,0], [4,4]) 
            possible_moves = [
                                [4,5], [4,6], [4,7], [4,3], 
                                [4,2], [4,1], [4,0], [5,4], 
                                [6,4], [3,4], [2,4]
                ]
                
            rook = board[[4,4]]

            expect(rook.move_dirs).to eq(possible_moves)
        end  

        it 'returns an empty array when there are no available moves' do 
            expect(rook.move_dirs).to be_empty
        end
    end 
end 