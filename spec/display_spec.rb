require 'rspec'
require 'display'

describe Display do 
    subject(:display) { Display.new(board) }
    let(:board) { Board.new }

    context '#initialize' do 
        it 'sets an instance variable of the chess board' do 
            expect(display.board).to eq(board)
        end 

        it 'instantiates a cursor variable' do 
            expect(display.cursor).to be_a(Cursor)
        end 
    end

    context '#render' do 
        it 'renders the board' do 
            display.render
            expect(display).to receive(:render)
            display.render 
        end 
    end 
end 