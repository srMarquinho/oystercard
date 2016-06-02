require 'journey_log'

describe JourneyLog do
	subject(:journey_log) {described_class.new(:journey_class)}
	let(:entry_station) {double :entry_station}
	
	describe '#start' do
		it 'expects entry station as an argument' do
			expect(journey_log.start(:entry_station)).to eq :entry_station
		end
	end

	describe '#finish' do
	end

	describe '#journeys' do
	end



end