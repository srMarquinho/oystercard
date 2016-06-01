
require_relative '../lib/oystercard'

describe 'feature test' do 
	my_card = Oystercard.new
	my_card.balance 
	my_card.top_up(5)
	# my_card.top_up(90)
	fare = 2 
	my_card.deduct(fare)
	my_card.in_journey?
	#my_card.touch_in
	
end 