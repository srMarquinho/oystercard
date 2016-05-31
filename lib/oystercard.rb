#Oystercard file 


class Oystercard

  attr_reader :balance, :user_travelling	
  MAXIMUM_BALANCE = 90

  def initialize
    @balance = 0
    @user_travelling = false
  end	

  def top_up(amount)
  	fail "ERROR: Balance limit is £ #{MAXIMUM_BALANCE}" if (balance + amount) > MAXIMUM_BALANCE
  	@balance += amount
  end   

  def deduct(fare)
  	@balance -= fare
  end

  def in_journey?
  	@user_travelling
  end

  def touch_in
    @user_travelling = true
  end

  def touch_out
    @user_travelling = false
  end

end