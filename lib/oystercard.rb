require_relative 'journey'

class Oystercard

  attr_reader :balance, :journey_log, :journey
  MAXIMUM_BALANCE = 90

  def initialize
    @balance = 0
    @journey = Journey.new
    @journey_log = JourneyLog.new
  end

  def top_up(amount)
    fail "ERROR: Balance limit is £ #{MAXIMUM_BALANCE}" if (balance + amount) > MAXIMUM_BALANCE
    @balance += amount
  end

  def touch_in(entry_station)
    fail "ERROR: Insufficient funds" if balance < Journey::MINIMUM_FARE
    deduct(journey_log.start_log(entry_station))
  end

  def touch_out(exit_station)
    deduct(journey_log.finish_log(exit_station))
  end

  private

  def deduct(fare)
    @balance -= fare
  end
end
