require 'journey'

describe Journey do

  subject(:journey) {described_class.new}
  subject(:complete_journey) {described_class.new(:entry_station, :exit_station)}
  subject(:incomplete_journey) {described_class.new(:entry_station)}

  describe 'Attributes' do
    it 'Is initialized as an empty journey' do
      expect(journey.entry_station || journey.exit_station).to be_nil
    end
  end

  describe '#fare' do
    it 'returns 0 if user did NOT touch_in AND touch_out' do
      expect(journey.fare).to eq 0
    end

    context 'user touched in and touched out' do
      it 'returns the minimum fare' do
        expect(complete_journey.fare).to eq Journey::MINIMUM_FARE
      end
    end

    context 'user forgot to touch_in or touch_out' do
      it 'returns the penalty fare' do
        expect(incomplete_journey.fare).to eq Journey::MAXIMUM_FARE
      end
    end
  end
end
