module Zones

attr_reader :stations

STATIONS = [['Green Park', 'Bank'], ['Peckham Rye', 'Clapham Common'], ['East Putney', 'Forest HJill']]

    def find_zone(station)
    STATIONS.each_with_index do |zone_array, index| 
       return index + 1 if zone_array.include?(station)
       end
    end
end