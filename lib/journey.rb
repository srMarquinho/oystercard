
class Journey

  MINIMUM_FARE = 1
  MAXIMUM_FARE = 6

  attr_accessor :entry_station, :exit_station

  def initialize(entry_station = nil)
    @entry_station = entry_station
  end

  def fare
    return 0 unless (entry_station || exit_station)
    return MAXIMUM_FARE unless (entry_station && exit_station)
    MINIMUM_FARE# + (entry_station.zone - exit_station.zone).abs
  end

  def finish(exit_station)
    exit_station
  end

  def complete?
    true
  end

end
