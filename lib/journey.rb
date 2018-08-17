class Journey

    attr_reader :journey

    def initialize
        @journey = {}
    end

    def start(station)
        @journey.merge!(start: station)
    end



end

