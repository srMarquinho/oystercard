
require_relative '../lib/oystercard'

describe 'feature test' do 
	mycard = Oystercard.new
	mycard.balance 
	mycard.top_up(5)
end 