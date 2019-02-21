require 'rspec'
require 'board'
require 'byebug'

describe Board do 
    subject(:board) { Board.new }

    context '#initializes' do 
        it 'should populate the board with the the correct positions' do
            rook_pos = [0,0] 
            expect(board[rook_pos]).to be_a(Rook)
            
            pawn_pos = [6,2]
            expect(board[pawn_pos]).to be_a(Pawn)
            
            null_pos = [4,4]
            expect(board[null_pos]).to be_an_instance_of(NullPiece)
        end 
    end 

    context '#empty?' do 
        it 'returns true if position is an instance of NullPiece' do 
            null_pos = [4,5]
            expect(board.empty?(null_pos)).to be_truthy
        end 

        it 'returns false if position is not an instance of NullPiece' do 
            not_null_pos = [0,0]
            expect(board.empty?(not_null_pos)).to be_falsey
        end 
    end 

    context '#move_piece' do 
        describe 'moves piece to new position if move is valid' do 
            it 'does not raise an error' do 
                start_pos = [0,0]
                end_pos = [5,4]
                expect { board.move_piece(start_pos, end_pos) }.to_not raise_error
            end

            it 'moves our piece to an enemy position' do 
                start_pos = [0,0]
                end_pos = [7,1]
                beggining_piece = board[start_pos]

                board.move_piece(start_pos, end_pos)
                expect(board[end_pos]).to be(beggining_piece)
            end 

            it 'moves our pieces to their correct locations without altering any other location' do
                beggining_piece = board[[0,1]]
                board.move_piece([0,1], [2,2])
                expect(board[[2,2]]).to be(beggining_piece)

                beggining_piece = board[[6,2]]
                board.move_piece([6,2], [4,2])
                expect(board[[4,2]]).to be(beggining_piece)

                beggining_piece = board[[2,2]]
                board.move_piece([2,2], [4,3])
                expect(board[[4,3]]).to be(beggining_piece)

                beggining_piece = board[[6,3]]
                board.move_piece([6,3], [5,3])
                expect(board[[5,3]]).to be(beggining_piece)

                beggining_piece = board[[4,3]]
                board.move_piece([4,3], [5,5])
                expect(board[[5,5]]).to be(beggining_piece)

                expect(board[[1,0]]).to be_a(Pawn)
                expect(board[[7,3]]).to be_a(Queen)
            end 

            it 'should update the piece\'s position' do 
                start_pos = [0,0]
                end_pos = [4,4]

                board.move_piece(start_pos, end_pos)
                expect(board[end_pos].pos).to eq([4,4])
            end 

            it 'moves our piece to an empty position' do 
                origin_piece = board[[0,0]]
                target_piece = board[[4,5]]

                expect(target_piece).to be_an_instance_of(NullPiece)
                board.move_piece([0,0], [4,5])
                expect(board[[4,5]]).to be_a(origin_piece.class)
            end 
        end 

        it 'raises error if the target position is invalid' do
            start_pos = [0,0]
            end_pos = [9,4]

            expect { board.move_piece(start_pos, end_pos) }.to raise_error(InvalidMoveError)
        end 
    end 

    context '#valid_move?' do 
        it 'returns true if move is within the board' do 
            expect(board.valid_move?([4,4])).to be_truthy
        end 

        it 'returns false if move is outside the board' do 
            expect(board.valid_move?([9,4])).to be_falsey 
        end 

        it 'returns false if move is outside the board' do 
            expect(board.valid_move?([4,8])).to be_falsey 
        end 
    end 
end 