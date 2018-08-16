require_relative 'zones'

class Station
include Zones # We want to give station a zone. Gives us all the methods we have declared in Zones

attr_reader :station_name

def initialize(name)
    @station_name = name
    @zone = find_zone(name)
end

end