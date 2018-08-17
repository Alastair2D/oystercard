class History

  attr_reader :journey_log

  def initialize
    @all_journeys = []
    @journey_log = {}
  end

  def store_journey(entry_station, exit_station)
    @journey_log['Entry'] = entry_station
    @journey_log['Exit'] = exit_station 
  end

end