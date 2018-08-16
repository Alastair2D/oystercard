module Zones

attr_reader :stations

# zone1 = ['Green Park', 'Bank']
# zone2 = ['Peckham Rye', 'Clapham Common']
# zone3 = ['East Putney', 'Forest Hill']
# all_stations = [[zone1, zone2, zone3]

STATIONS = [['Green Park', 'Bank'], ['Peckham Rye', 'Clapham Common'], ['East Putney', 'Forest HJill']]

    def find_zone(station)
    STATIONS.each_with_index do |zone_array, index| 
       return index + 1 if zone_array.include?(station)
       end
    end
end