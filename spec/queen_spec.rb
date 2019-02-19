require 'rspec'
require 'pieces/queen'

describe Queen do 
    subject(:queen) { board[[0,3]] }
    let(:board) { Board.new }

    context '#initialize' do 
        it 'sets an instance variable of position' do 
            expect(queen.pos).to eq([0,3])
        end 

        it 'sets an instance variable of color' do 
            expect(queen.color).to eq(:white)
        end 

        it 'sets an instance variable of the chess board' do 
            expect(queen.board).to eq(board)
        end 

        it 'assigns a symbol' do 
            expect(queen.symbol).to_not be_empty
        end 
    end

    context '#move_dirs' do 
        it 'returns all possible moves for this piece' do 
            board.move_piece([0,3], [4,4]) 
            possible_moves = [
                                [4,5], [4,6], [4,7], [4,3], 
                                [4,2], [4,1], [4,0], [5,4], 
                                [6,4], [3,4], [2,4], [5,5], 
                                [6,6], [5,3], [6,2], [3,5], 
                                [2,6], [3,3], [2,2]
                ]
                
            queen = board[[4,4]]

            expect(queen.move_dirs).to eq(possible_moves)
        end  

        it 'returns an empty array when there are no available moves' do 
            expect(queen.move_dirs).to be_empty
        end
    end 
end 