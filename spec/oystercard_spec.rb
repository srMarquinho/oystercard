require 'oystercard'

describe Oystercard do

  subject(:oystercard) {described_class.new}

  let(:entry_station) {double :entry_station}
  let(:exit_station) {double :exit_station}

  describe "Attributes" do
    it "Has a default balance of 0" do
      expect(oystercard.balance).to eq 0
    end
  end

  describe "#top_up" do
    before { oystercard.top_up(Oystercard::MAXIMUM_BALANCE) }

    it "Tops up the balance with the amount passed to top_up" do
      expect(oystercard.balance).to eq Oystercard::MAXIMUM_BALANCE
    end

    it "Refuses balance over maximum_balance balance" do
      expect {oystercard.top_up(Journey::MINIMUM_FARE)}.to raise_error(
      "ERROR: Balance limit is £ #{Oystercard::MAXIMUM_BALANCE}")
    end
  end

  describe "#touch_in" do
    it "Refuses touch_in if balance is less than minimum_fare fare" do
      oystercard.top_up(Journey::MINIMUM_FARE - 1)
      expect {oystercard.touch_in(entry_station)}.to raise_error "ERROR: Insufficient funds"
    end
end

  describe "#touch_out" do
    before { oystercard.top_up(Oystercard::MAXIMUM_BALANCE) }

    it "Dedcuts from the balance at touch out" do
      oystercard.touch_in(entry_station)
      expect{oystercard.touch_out(exit_station)}.to change{ oystercard.balance }.by -Journey::MINIMUM_FARE
    end

    # it 'Saves the entire trip at the end of the journey' do
    #   oystercard.touch_in
    #   oystercard.touch_out(exit_station)
    #   expect(oystercard.journey_history).not_to be_nil
    # end
  end
end
