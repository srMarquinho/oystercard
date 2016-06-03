require 'journey_log'

describe JourneyLog do

  let(:journey) {double :journey}
  let(:journey_class) {double :journey_class}
  let(:entry_station) {double :entry_station}
  let(:exit_station) {double :exit_station}


  subject(:journey_log) {described_class.new}

  describe '#start_log' do
    it 'expects entry station as an argument' do
      # expect(journey_class).to receive(:new).with(entry_station)
      journey_log.start_log(entry_station)
    end


  end

  describe '#finish_log' do
    it 'expects exit station as an argument' do
      # expect(journey_class).to receive(:new).with(exit_station)
      journey_log.start_log(entry_station)
      journey_log.finish_log(exit_station)
    end
  end

  describe '#journeys' do
  end

end
