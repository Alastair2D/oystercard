require './lib/oystercard'

describe "Oystercard features tests" do 

    it 'shows balance on my card' do 
        create_new_card
        card_shows_balance
    end
    it 'adds money to my card' do 
        create_new_card
        top_up_card
    end
    it 'sets a maximum limit for the balance on my card' do 
        create_new_card
        top_up_over_limit
    end
    it 'deducts correct fare for journey from card' do
        create_new_card
        top_up_card
        touch_in
        deducts_correct_fare_on_touch_out
    end
    it 'records journey status' do 
        create_new_card
        top_up_card
        touch_in
        card_shows_as_in_use
    end
    it 'stores touch_in entry station' do 
        create_new_card
        top_up_card
        touch_in
        stores_entry_station
    end 
    it 'stores touch_out exit station' do 
        create_new_card
        top_up_card
        touch_in
        touch_out
    end
    it 'stores all previous trips' do 
    end
    it 'knows what zone a station is in' do 
    end
    it 'deducts a penalty fare if I fail to touch in or out' do 
    end

end

def create_new_card 
    @oc1 = Oystercard.new    # @ instance Vs. $ global variable
end

def card_shows_balance
    expect(@oc1.balance).to eq 0
end

def top_up_card
    @oc1.top_up(10)
end

def top_up_over_limit
    expect{ @oc1.top_up(91) }. to raise_error "ERROR - Exceeds maximum balance of £#{Oystercard::MAXIMUM_BALANCE}"
end

def touch_in
    @oc1.touch_in('station')
end

def card_shows_as_in_use
    expect(@oc1.in_journey?).to be true
end

def touch_out
    @oc1.touch_out('station')
end

def deducts_correct_fare_on_touch_out
    expect { @oc1.touch_out('station') }.to change { @oc1.balance }.by(-Oystercard::MINIMUM_FARE)
end

def stores_entry_station
    expect(@oc1.current_journey).to include 'station'
end

def stores_exit_station
    expect(@oc1.current_journey).to include 'Exit'
end