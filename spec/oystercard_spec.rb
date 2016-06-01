require 'oystercard'

describe Oystercard do

  subject(:oystercard) {described_class.new}

  let(:maximum) { Oystercard::MAXIMUM_BALANCE }
  let(:minimum) { Oystercard::MINIMUM_FARE }
  let(:entry_station) {double :station}
  let(:exit_station) {double :station}


  describe "Attributes" do
	  it "Has a default balance of 0" do
      expect(oystercard.balance).to eq 0
 	  end

 	  it "Each oystercard is initialized as not in journey" do
      expect(oystercard).not_to be_in_journey
    end

    it 'initializes with an empty trip history' do
      expect(oystercard.trips).to be_empty
    end
  end

  describe "#top_up" do
    before { oystercard.top_up(maximum) }

    it "Tops up the balance with the amount passed to top_up" do
  	  expect(oystercard.balance).to eq maximum
    end

    it "Refuses balance over maximum balance" do
  	  expect {oystercard.top_up(minimum)}.to raise_error(
      "ERROR: Balance limit is £ #{maximum}")
    end
  end

  describe "#touch_in" do
    it "Touches in at the beginning of journey" do
      oystercard.top_up(maximum)
      oystercard.touch_in(entry_station)
      expect(oystercard.in_journey?).to be true
    end

    it "Refuses touch_in if balance is less than minimum fare" do
  	  oystercard.top_up(minimum - 1)
  	  expect {oystercard.touch_in(entry_station)}.to raise_error "ERROR: Insufficient funds"
    end

    it "Remembers the entry station" do
      oystercard.top_up(maximum)
      oystercard.touch_in(entry_station)
      expect(oystercard.journey[:entry_station]).not_to be_nil
    end
end

  describe "#touch_out" do
    before { oystercard.top_up(maximum) }

    it "Touches out at the end of the journey" do
  	  oystercard.touch_in(entry_station)
  	  oystercard.touch_out(exit_station)
  	  expect(oystercard.in_journey?).to be false
    end

    it "Dedcuts from the balance at touch out" do
      oystercard.touch_in(entry_station)
      expect{oystercard.touch_out(exit_station)}.to change{ oystercard.balance }.by -minimum
    end

    it "Forgets the entry station" do
      oystercard.touch_in(entry_station)
      oystercard.touch_out(exit_station)
      expect(oystercard.journey[:entry_station]).to be_nil
    end

    it 'Receives a station as an argument' do
      expect(oystercard).to respond_to(:touch_out).with(1).arguments
    end

    it 'Saves the entire trip at the end of the journey' do
      first_trip = {:entry_station => entry_station, :exit_station => exit_station}
      oystercard.touch_in(entry_station)
      oystercard.touch_out(exit_station)
      expect(oystercard.trips[0]).to eq first_trip
    end
  end
end
