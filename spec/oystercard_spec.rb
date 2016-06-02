require 'oystercard'

describe Oystercard do

  subject(:oystercard) {described_class.new}

  let(:maximum_balance) { Oystercard::MAXIMUM_BALANCE }
  let(:minimum_fare) { Journey::MINIMUM_FARE }

  describe "Attributes" do
    it "Has a default balance of 0" do
      expect(oystercard.balance).to eq 0
    end

    it 'initializes with an empty trip history' do
      expect(oystercard.journey_history).to be_empty
    end
  end

  describe "#top_up" do
    before { oystercard.top_up(maximum_balance) }

    it "Tops up the balance with the amount passed to top_up" do
  	  expect(oystercard.balance).to eq maximum_balance
    end

    it "Refuses balance over maximum_balance balance" do
  	  expect {oystercard.top_up(minimum_fare)}.to raise_error(
      "ERROR: Balance limit is £ #{maximum_balance}")
    end
  end

  describe "#touch_in" do
    it "Refuses touch_in if balance is less than minimum_fare fare" do
  	  oystercard.top_up(minimum_fare - 1)
  	  expect {oystercard.touch_in}.to raise_error "ERROR: Insufficient funds"
    end
end

  describe "#touch_out" do
    before { oystercard.top_up(maximum_balance) }

    it "Dedcuts from the balance at touch out" do
      oystercard.touch_in
      expect{oystercard.touch_out}.to change{ oystercard.balance }.by -minimum_fare
    end

    # it 'Saves the entire trip at the end of the journey' do
    #   oystercard.touch_in
    #   oystercard.touch_out(exit_station)
    #   expect(oystercard.journey_history).not_to be_nil
    # end
  end
end
