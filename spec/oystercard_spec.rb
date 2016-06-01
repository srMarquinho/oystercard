#Oystercard test file.
require 'oystercard'

describe Oystercard do

  subject(:oystercard) {described_class.new}

  let(:maximum) { Oystercard::MAXIMUM_BALANCE }
  let(:minimum) { Oystercard::MINIMUM_FARE }

  describe "Attributes" do

	  it "has a default balance of 0" do
      expect(oystercard.balance).to eq 0
 	  end

 	  it "Each oystercard is initialized as not in journey" do
      expect(oystercard).not_to be_in_journey
    end

  end


  describe "#top_up" do

    before { oystercard.top_up(maximum) }

    it "Tops up the balance with the amount passed to top_up" do
  	  expect(oystercard.balance).to eq maximum
    end

    it "Refuses balance over 90" do
  	  expect {oystercard.top_up(minimum)}.to raise_error
      "ERROR: Balance limit is £ #{maximum}"
    end
  end

describe "#touch_in" do

    it "Touches in at the beginning of journey" do
      oystercard.top_up(maximum)
      oystercard.touch_in
      expect(oystercard.in_journey?).to be true
    end

    it "Will not allow touch_in if balance is less than minimum fare" do
  	  oystercard.top_up(minimum - 1)
  	  expect {oystercard.touch_in}.to raise_error "ERROR: Insufficient funds"
    end
end

  describe "#touch_out" do

    before { oystercard.top_up(maximum) }

    it "Touches out at the end of the journey" do
  	  oystercard.touch_in
  	  oystercard.touch_out
  	  expect(oystercard.in_journey?).to be false
    end

    it "Dedcuts from the balance at touch out" do
      oystercard.touch_in
      expect{oystercard.touch_out}.to change{ oystercard.balance }.by -minimum

    end
  end
end
