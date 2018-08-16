require 'journeys'

describe Journeys do
  
  subject(:journeys) { Journeys.new }
  let(:mockCard) { double :oystercard }
  let(:mockEntryStation) { double :entrystation }
  let(:mockExitStation) { double :exitstation }

  describe '#initialize' do
    it 'defaults with an empty @journey_log' do
      expect(subject.journey_log).to be {}
    end
  end
  
  describe '#store_journey' do
    it 'adds current journey to @journey_log' do 
    # allow(mockCard).to receive(:touch_in(mockEntryStation))
    # allow(mockCard).to receive(:touch_out(mockExitStation))
      subject.store_journey(mockEntryStation, mockExitStation)
      expect(subject.journey_log).to eq({"Entry" => mockEntryStation, "Exit" => mockExitStation})
    end
  end

end