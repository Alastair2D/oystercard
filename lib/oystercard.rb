require_relative 'station'
require_relative 'journeys'

class Oystercard

  attr_reader :balance, :in_journey, :entry_station, :current_journey

MINIMUM_FARE = 1
MAXIMUM_BALANCE = 90

  def initialize(balance = 0, in_journey = false)
    @balance = balance
    @in_journey = in_journey
    @entry_station = nil
    @exit_station = nil
    @current_journey = {}
  end

  def in_journey?
    !!entry_station
  end

  def top_up(amount)
    fail "ERROR - Exceeds maximum balance of £#{MAXIMUM_BALANCE}" if @balance + amount >= MAXIMUM_BALANCE
    @balance += amount
  end

  def touch_in(station)
    fail 'Error - insufficient funds' if balance < MINIMUM_FARE
    @entry_station = station
    @current_journey["Entry"] = station
  end

  def touch_out(station)
    @balance -= MINIMUM_FARE
    @current_journey["Exit"] = station
    # journey_instance.store_journey(entry_station, exit_station)
    @entry_station = nil
    @exit_station
  end

  private
  def deduct(fare)
    @balance -= fare 
  end

end