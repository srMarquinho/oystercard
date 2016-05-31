#Oystercard test file.
require 'oystercard'

describe Oystercard do	
  subject(:oystercard) {described_class.new}	
  it "has a default balance of 0" do
    expect(oystercard.balance).to eq 0
  end

  it "Tops up the balance with the amount passed to top_up" do
  	oystercard.top_up(5)
  	expect(oystercard.balance).to eq 5
  end

  it "Refuses balance over 90" do
  	maximum = Oystercard::MAXIMUM_BALANCE
  	oystercard.top_up(maximum)
  	expect {oystercard.top_up(1)}.to raise_error "ERROR: Balance limit is £ #{Oystercard::MAXIMUM_BALANCE}"
  end

  it "Deducts a specified fare" do
  	oystercard.top_up(5)
  	expect(oystercard.deduct(4)).to eq 1
  	# COULD DO : expect{ subject.deduct 3}.to change{ subject.balance }.by -3 
  end 

  it "Each oystercard is initialized as not in journey" do
    expect(oystercard.in_journey?).to be false
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

end