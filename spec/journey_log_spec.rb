require 'journey_log'

describe JourneyLog do

  let(:journey) {double :journey}
  let(:journey_class) {double :journey_class}
  let(:entry_station) {double :entry_station}

  subject(:journey_log) {described_class.new(journey_class)}

  describe '#start' do
    it 'expects entry station as an argument' do
      expect(journey_class).to receive(:new).with(entry_station)
      journey_log.start(entry_station)
    end
  end

  describe '#finish' do
  end

  describe '#journeys' do
  end

end
