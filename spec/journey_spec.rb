require 'journey'

describe Journey do 
subject(:journey) { Journey.new }
let(:mockOystercard) { double :oystercard, balance => 20 }
let(:mockEntryStation) { double :station }
 
    describe '#initialize' do 
        it 'defaults with an empty @journey hash' do
            expect(subject.journey).to be {}
        end
    end 

    describe '#start' do 
        it 'adds entry station to @journey hash' do 
            expect(subject.start(mockEntryStation)).to eq(start: mockEntryStation)
        end
    end


end
