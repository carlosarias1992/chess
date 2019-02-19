require 'rspec'
require 'pieces/king'

describe King do 
    subject(:king) { board[[0,4]] }
    let(:board) { Board.new }

    context '#initialize' do 
        it 'sets an instance variable of position' do 
            expect(king.pos).to eq([0,4])
        end 

        it 'sets an instance variable of color' do 
            expect(king.color).to eq(:white)
        end 

        it 'sets an instance variable of the chess board' do 
            expect(king.board).to eq(board)
        end 

        it 'assigns a symbol' do 
            expect(king.symbol).to_not be_empty
        end 
    end

    context '#move_dirs' do 
        it 'returns all possible moves for this piece' do 
            board.move_piece([0,4], [4,4]) 
            possible_moves = [
                                [4, 5], [4, 3], [5, 4], 
                                [5, 3], [3, 4], [3, 3], 
                                [3, 5], [5, 5]
                ]
                
            king = board[[4,4]]

            expect(king.move_dirs).to eq(possible_moves)
        end  

        it 'returns an empty array when there are no available moves' do 
            expect(king.move_dirs).to be_empty
        end
    end 
end 