
class Journey

  MINIMUM_FARE = 1
  PENALTY_FARE = 6

  def initialize #(entry_station = nil)
    # @entry_station = entry_station
  end

  def fare
    return 0 unless (@entry_station || @exit_station)
    return PENALTY_FARE unless (@entry_station && @exit_station)
    MINIMUM_FARE
  end

  def start(entry_station)
    @entry_station = entry_station
  end

  def finish(exit_station)
    @exit_station = exit_station
  end

  def complete?
    !!(@entry_station && @exit_station)
  end

end
