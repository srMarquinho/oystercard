require 'station'

describe Station do

  subject(:station) {described_class.new("Old Street", 1)}

  describe "Attributes" do
    it "Knows its name" do
      expect(station.name).to eq "Old Street"
    end

    it "Knows its zone" do
      expect(station.zone).to eq 1
    end
  end
end
