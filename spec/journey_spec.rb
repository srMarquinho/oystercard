require 'journey'

describe Journey do

  subject(:journey) {described_class.new(:entry_station)}
  subject(:journey) {described_class.new(:entry_station)}

  describe '#finish' do
    it 'allows a journey to end' do
      expect(journey.finish(:exit_station)).to eq :exit_station
    end
  end

  describe '#complete?' do
    it 'returns true if a journey is complete' do
      journey.finish(:exit_station)
      expect(journey.complete?).to be true
    end
    it 'returns false if a journey is incomplete' do
      expect(journey.complete?). to be false
    end
    it 'returns '
  end



end
