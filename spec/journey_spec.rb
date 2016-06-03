require 'journey'

describe Journey do

  subject(:journey1) {described_class.new}
  subject(:journey2) {described_class.new}

  let(:entry_station) {double :entry_station}
  let(:exit_station) {double :exit_station}
  let(:minimum_fare) { Journey::MINIMUM_FARE }
  let(:penalty_fare) { Journey::PENALTY_FARE }

  describe '#finish' do
    it 'charge penalty fare if no touch in' do
      expect(journey1.finish(exit_station)).to eq penalty_fare
    end
  end

  describe '#fare' do
    it 'charges minimum fare for complete journey' do
      journey1.start(entry_station)
      journey1.finish(exit_station)
      expect(journey1.fare).to eq minimum_fare
    end

    it 'charges penalty fare when no entry station' do
      journey2.finish(exit_station)
      expect(journey2.fare).to eq penalty_fare
    end

    # it 'charges penalty fare when no exit station' do
    #   expect(journey1.fare).to eq penalty_fare
    # end
  end
end
