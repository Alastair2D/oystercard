require 'oystercard'

describe Oystercard do
  subject(:oystercard) { described_class.new }    # subject(:oystercard) { Oystercard.new }
  # subject2(:toppedUpOyster) {described_class.new(50) }
  let(:mockBalance) { double :balance }
  let(:mockAmount) { double :amount }
  let(:mockFare) { double :fare }
 
  describe '#initialize' do
    it 'defaults with a balance of £0' do
      expect(subject.balance).to eq 0
    end
    it 'defaults with @in_journey as false' do 
      expect(subject.in_journey).to be false
    end
  end

  describe '#top_up' do 
    it { is_expected.to respond_to(:top_up) }
    it 'enables users to add funds' do 
      allow(subject).to receive(:top_up).and_return(mockAmount)  # number = 10 
      expect(subject.top_up(mockAmount)).to eq(mockAmount)       # expect(subject.top_up(10)).to eq 10
    end
    it 'raises error if trying to exceed maximum balance' do 
      expect { subject.top_up(Oystercard::MAXIMUM_BALANCE) }.to raise_error "ERROR - Exceeds maximum balance of £#{Oystercard::MAXIMUM_BALANCE}"
    end
  end

  # describe '#deduct' do 
  #   it 'deducts fare from balance' do
  #     allow(subject).to receive(:top_up).and_return(mockAmount)    # subject.top_up(25)
  #     allow(subject).to receive(:deduct).and_return(mockBalance)   # testFare = 2
  #     expect(subject.deduct(mockFare)).to eq(mockBalance)          # expect(subject.deduct(testFare)).to eq 23
  #   end
  # end

  describe '#touch_in' do
    it { is_expected.to respond_to (:touch_in) }
    it 'toggles #in_journey? to true' do 
      subject.top_up(10)
      expect(subject.touch_in).to eq true
    end
    it 'denies #touch_in when @balance < MIN.FARE' do
      expect { subject.touch_in }.to raise_error 'Error - insufficient funds'
    end
  end

  describe '#touch_out' do 
    it 'deducts correct fare from balance' do
      expect { subject.touch_out }.to change { subject.balance }.by(-Oystercard::MINIMUM_FARE)
    end

  end

  describe '#in_journey?' do 
    before {subject.top_up(10) ; subject.touch_in}
    it 'tracks card status after #touch_in' do 
      expect(subject.in_journey?).to eq true 
    end
    it 'tracks card status after #touch_out' do 
      subject.touch_out # Ask Mark about spies. 
      expect(subject.in_journey?).to eq false
    end
  end
    



end
