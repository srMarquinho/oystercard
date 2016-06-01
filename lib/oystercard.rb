#Oystercard file


class Oystercard

  attr_reader :balance, :entry_station
  MAXIMUM_BALANCE = 90
  MINIMUM_FARE = 1

  def initialize
    @balance = 0
    @entry_station = nil
  end

  def top_up(amount)
  	fail "ERROR: Balance limit is £ #{MAXIMUM_BALANCE}" if (balance + amount) > MAXIMUM_BALANCE
  	@balance += amount
  end


  def in_journey?
  	!entry_station.nil?
  end

  def touch_in(entry_station)
  	fail "ERROR: Insufficient funds" if balance < MINIMUM_FARE
    @entry_station = entry_station
  end

  def touch_out
    deduct(MINIMUM_FARE)
    @entry_station = nil
  end

  private


  def deduct(fare)
  	@balance -= fare
  end

end
