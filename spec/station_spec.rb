require 'station'

describe 'Station' do 
    subject(:zone1Station) { Station.new('Green Park') } #subject { described_class.new(mockWeatherStation) }
    subject(:zone2Station) { Station.new('Peckham Rye') }
    subject(:zone3Station) { Station.new('Forest Hill') }
    let(:mockStation) { double :station }

    describe '#initialize' do 
        it 'defaults with a name' do 
            expect(zone1Station.station_name).to eq 'Green Park'
        end
    end




end