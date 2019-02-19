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

    context '#turn' do 
        it 'should request an input'
    end 
end 