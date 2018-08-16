require './lib/oystercard'

describe "Oystercard features tests" do 

    it 'as a user, I want to be able to see the balance on my car' do 
        create_new_card
        card_shows_balance
    end

    it 'it deducts correct fare for journey from card' do
        create_new_card
        top_up_card
        touch_in
        deducts_correct_fare_on_touch_out
    end
    
end

def create_new_card 
    @o1 = Oystercard.new    # @ instance Vs. $ global variable
end

def card_shows_balance
    expect(@o1.balance).to eq 0
end

def top_up_card
    @o1.top_up(10)
end

def touch_in
    @o1.touch_in('station')
end

def deducts_correct_fare_on_touch_out
    expect { @o1.touch_out('station') }.to change { @o1.balance }.by(-Oystercard::MINIMUM_FARE)
end