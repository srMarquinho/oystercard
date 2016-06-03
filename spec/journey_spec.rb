# require 'journey'
#
# describe Journey do
#
#   subject(:journey1) {described_class.new(:entry_station)}
#   subject(:journey2) {described_class.new}
#
#   let(:minimum_fare) { Journey::MINIMUM_FARE }
#   let(:penalty_fare) { Journey::PENALTY_FARE }
#
#   describe '#finish' do
#     it 'allows a journey to end' do
#       expect(journey1.finish(:exit_station)).to eq :exit_station
#     end
#   end
#
#   describe '#complete?' do
#     it 'returns true if a journey is complete' do
#       journey1.finish(:exit_station)
#       expect(journey1.complete?).to be true
#     end
#     it 'returns false if no exit station' do
#       expect(journey1.complete?).to be false
#     end
#     it 'returns false if no entry station' do
#       journey2.finish(:exit_station)
#       expect(journey2.complete?).to be false
#     end
#   end
#
#   describe '#fare' do
#     it 'charges minimum fare for complete journey' do
#       journey1.finish(:exit_station)
#       expect(journey1.fare).to eq minimum_fare
#     end
#
#     it 'charges penalty fare when no entry station' do
#       journey2.finish(:exit_station)
#       expect(journey2.fare).to eq penalty_fare
#     end
#
#     it 'charges penalty fare when no exit station' do
#       expect(journey1.fare).to eq penalty_fare
#     end
#   end
# end
