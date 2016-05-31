#Oystercard test file.
require 'oystercard'

describe Oystercard do	
  subject(:oystercard) {described_class.new}	

  describe "Attributes" do

	it "has a default balance of 0" do
      expect(oystercard.balance).to eq 0
 	end

 	it "Each oystercard is initialized as not in journey" do
    expect(oystercard.in_journey?).to be false
  end

  end


  describe "Methods" do

  before do 
  	oystercard.top_up(Oystercard::MAXIMUM_BALANCE)
  end

  it "Tops up the balance with the amount passed to top_up" do
  	expect(oystercard.balance).to eq Oystercard::MAXIMUM_BALANCE
  end

  it "Refuses balance over 90" do
  	expect {oystercard.top_up(1)}.to raise_error "ERROR: Balance limit is £ #{Oystercard::MAXIMUM_BALANCE}"
  end

  it "Deducts a specified fare" do
	expect{ subject.deduct 3}.to change{ subject.balance }.by -3 
  end 

  it "Touches in at the beginning of journey" do
    oystercard.touch_in
    expect(oystercard.in_journey?).to be true
  end

  it "Touches out at the end of the journey" do
  	oystercard.touch_in
  	oystercard.touch_out
  	expect(oystercard.in_journey?).to be false
  end

  it "Will not allow touch_in if balance is less than minimum fare" do
  	oystercard.deduct(Oystercard::MAXIMUM_BALANCE)
  	minimum = Oystercard::MINIMUM_FARE
  	oystercard.top_up(minimum - 1)
  	expect {oystercard.touch_in}.to raise_error "ERROR: Insufficient funds"
  end

end
end