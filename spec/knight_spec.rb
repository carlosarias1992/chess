require 'rspec'
require 'pieces/knight'

describe Knight do 
    subject(:knight) { board[[0,1]] }
    let(:board) { Board.new }

    context '#initialize' do 
        it 'sets an instance variable of position' do 
            expect(knight.pos).to eq([0,1])
        end 

        it 'sets an instance variable of color' do 
            expect(knight.color).to eq(:white)
        end 

        it 'sets an instance variable of the chess board' do 
            expect(knight.board).to eq(board)
        end 

        it 'assigns a symbol' do 
            expect(knight.symbol).to_not be_empty
        end 
    end

    context '#move_dirs' do 
        it 'returns all possible moves for this piece' do 
            board.move_piece([0,1], [4,4]) 
            possible_moves = [
                                [6, 5], [5, 6], [5, 2], 
                                [3, 6], [3, 2], [2, 5], 
                                [6, 3], [2, 3]
                ]
                
            knight = board[[4,4]]

            expect(knight.move_dirs).to eq(possible_moves)
        end  

        it 'returns an empty array when there are no available moves' do 
            board.move_piece([1,1], [2,2]) 
            board.move_piece([1,2], [2,0]) 

            expect(knight.move_dirs).to be_empty
        end
    end 
end 