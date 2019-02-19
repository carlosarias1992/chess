require 'rspec'
require 'cursor'

describe Cursor do 
    subject(:cursor) { Cursor.new([0,0], board)}
    let(:board) { 
        double('board', :grid => Array.new(8) { Array.new(8) }, :valid_move? => true) 
    }
    let(:invalid_move_board) { double('invalid_move_board', :valid_move? => false) }

    context "#initialize" do 
        it 'sets the initial cursor position' do 
            expect(cursor.cursor_pos).to eq([0,0])
        end 

        it 'creates an instance variable of the chess board' do 
            expect(cursor.board).to be_a(board.class)
        end 
    end 

    context '#update_pos' do 
        it 'updates the current cursor position' do 
            cursor.update_pos([0,1])
            expect(cursor.cursor_pos).to eq([0,1])
        end 

        it 'does not update the cursor position when move is invalid' do 
            cursor = Cursor.new([0,0], invalid_move_board)
            cursor.update_pos([0,-1])
            expect(cursor.cursor_pos).to eq([0,0])
        end 
    end 
end 