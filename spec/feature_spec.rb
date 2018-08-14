require './lib/oystercard'

describe "Oystercard features tests" do 

    it 'as a user, I want to be able to see the balance on my car' do 
        create_new_card
        card_shows_balance
    end
end

def create_new_card 
    @o1 = Oystercard.new    # @ instance Vs. $ global variable
end

def card_shows_balance
    expect(@o1.balance).to eq 0
end
