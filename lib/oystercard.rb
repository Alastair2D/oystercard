class Oystercard

  attr_reader :balance, :in_journey, :entry_station

MINIMUM_FARE = 1
MAXIMUM_BALANCE = 90

  def initialize(balance = 0, in_journey = false)
    @balance = balance
    @in_journey = in_journey
    @entry_station = nil
  end

  def in_journey?
    @in_journey
  end

  def top_up(amount)
    fail "ERROR - Exceeds maximum balance of £#{MAXIMUM_BALANCE}" if @balance + amount >= MAXIMUM_BALANCE
    @balance += amount
  end

  def touch_in(station)
    fail 'Error - insufficient funds' if balance < MINIMUM_FARE
    @entry_station = station
    @in_journey = true 
  end

  def touch_out
    @in_journey = false
    @balance -= MINIMUM_FARE
    @entry_station = nil
  end

  private
  def deduct(fare)
    @balance -= fare 
  end

end