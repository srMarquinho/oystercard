class OysterCard

	MAXIMUM_BALANCE = 90
	MINIMUM_BALANCE = 1
	MINIMUM_CHARGE = 1

	attr_reader :balance

	def initialize
		@balance = 0
    @in_journey = false
	end

  def top_up(amount)
  	fail "Maximum balance of #{MAXIMUM_BALANCE} has been reached." if (amount + @balance) > MAXIMUM_BALANCE
    @balance += amount
  end

  def deduct(amount)
    @balance -= amount
  end

  def in_journey?
    @in_journey
  end

  def touch_in
  	fail "Not enough balance" if @balance < MINIMUM_BALANCE
    @in_journey = true
  end

  def touch_out
    @in_journey = false
    deduct(MINIMUM_CHARGE)
  end

  private :deduct

end
