require_relative 'journey'

class Oystercard

  attr_reader :balance, :journey_history, :journey
  MAXIMUM_BALANCE = 90

  def initialize(journey = Journey.new)
    @balance = 0
    @journey = journey
    @journey_history = Array.new
  end

  def top_up(amount)
    fail "ERROR: Balance limit is £ #{MAXIMUM_BALANCE}" if (balance + amount) > MAXIMUM_BALANCE
    @balance += amount
  end

  # def in_journey?
  #   !!journey.entry_station
  # end

  def touch_in(entry_station)
    fail "ERROR: Insufficient funds" if balance < Journey::MINIMUM_FARE
    @journey.entry_station = entry_station
  end

  def touch_out(exit_station)
    @journey.exit_station = exit_station
    deduct(journey.fare)
    @journey_history << journey
    @journey = Journey.new
  end

  private

  def deduct(fare)
    @balance -= fare
  end
end
