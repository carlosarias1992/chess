require 'rspec'
require 'pieces/bishop'

describe Bishop do 
    subject(:bishop) { board[[0,2]] }
    let(:board) { Board.new }

    context '#initialize' do 
        it 'sets an instance variable of position' do 
            expect(bishop.pos).to eq([0,2])
        end 

        it 'sets an instance variable of color' do 
            expect(bishop.color).to eq(:white)
        end 

        it 'sets an instance variable of the chess board' do 
            expect(bishop.board).to eq(board)
        end 

        it 'assigns a symbol' do 
            expect(bishop.symbol).to_not be_empty
        end 
    end

    context '#move_dirs' do 
        it 'returns all possible moves for this piece' do 
            board.move_piece([0,2], [4,4]) 
            possible_moves = [
                                [5, 5], [6, 6], [5, 3], 
                                [6, 2], [3, 5], [2, 6], 
                                [3, 3], [2, 2]
                ]
                
            bishop = board[[4,4]]

            expect(bishop.move_dirs).to eq(possible_moves)
        end  

        it 'returns an empty array when there are no available moves' do 
            expect(bishop.move_dirs).to be_empty
        end
    end 
end 