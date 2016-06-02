require_relative 'journey'

class Oystercard

  attr_reader :balance, :journey_history
  MAXIMUM_BALANCE = 90

  def initialize
    @balance = 0
    @journey_history = Array.new
  end

  def top_up(amount)
    fail "ERROR: Balance limit is £ #{MAXIMUM_BALANCE}" if (balance + amount) > MAXIMUM_BALANCE
    @balance += amount
  end

  def touch_in
    fail "ERROR: Insufficient funds" if balance < Journey::MINIMUM_FARE
  end

  def touch_out
    deduct(Journey::MINIMUM_FARE)
  end

  private

  def deduct(fare)
    @balance -= fare
  end
end
