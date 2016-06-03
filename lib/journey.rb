

class Journey

  MINIMUM_FARE = 1
  PENALTY_FARE = 6

  def initialize
		@entry_station = nil
		@exit_station = nil
	end

  def fare
    @entry_station && @exit_station ? MINIMUM_FARE : PENALTY_FARE
  end

  def start(entry_station)
    @entry_station = entry_station
    fare
  end

  def finish(exit_station)
    @exit_station = exit_station
    fare
  end

end
