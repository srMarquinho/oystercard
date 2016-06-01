class Oystercard

  attr_reader :balance, :journey_history, :journey
  MAXIMUM_BALANCE = 90
  MINIMUM_FARE = 1

  def initialize
    @balance = 0
    @journey = Hash.new
    @journey_history = Array.new
  end

  def top_up(amount)
  	fail "ERROR: Balance limit is £ #{MAXIMUM_BALANCE}" if (balance + amount) > MAXIMUM_BALANCE
  	@balance += amount
  end

  def in_journey?
  	!!journey[:entry_station]
  end

  def touch_in(entry_station)
  	fail "ERROR: Insufficient funds" if balance < MINIMUM_FARE
    @journey[:entry_station] = entry_station
  end

  def touch_out(exit_station)
    deduct(MINIMUM_FARE)
    @journey[:exit_station] = exit_station
    @journey_history << journey
    @journey = Hash.new
  end

  private

  def deduct(fare)
  	@balance -= fare
  end
end
