require 'journey_log'

describe JourneyLog do

  let(:journey) {double :journey}
  let(:journey_class) {double :journey_class}
  let(:entry_station) {double :entry_station}
  let(:exit_station) {double :exit_station}


  subject(:journey_log) {described_class.new}

  describe '#start_log' do
    it 'expects entry station as an argument' do
      journey_log.start_log(entry_station)
    end

    it 'returns nil for exit_station if no touch out' do
      2.times {journey_log.start_log(entry_station)}
      expect(journey_log.past_journeys).to eq [[entry_station, nil]]
    end

  end

  describe '#finish_log' do
    it 'expects exit station as an argument' do
      journey_log.start_log(entry_station)
      journey_log.finish_log(exit_station)
    end

    it "returns the penalty fare if no touch in" do
      expect(journey_log.finish_log(exit_station)).to eq Journey::PENALTY_FARE
    end

    it 'returns nil for entry_station if no touch in' do
      journey_log.finish_log(exit_station)
      expect(journey_log.past_journeys).to eq [[nil, exit_station]]
    end
  end

    it "returns past journeys" do
      journey_log.start_log(entry_station)
      journey_log.finish_log(exit_station)
      expect(journey_log.past_journeys).to eq [[entry_station, exit_station]]
    end

end
