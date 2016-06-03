require_relative 'journey'

class JourneyLog

  def initialize
	end

  def start_log(entry_station)
    @journey = Journey.new
    journey.start(entry_station)
  end

  def finish_log(exit_station)
    journey.finish(exit_station)

  end

  def journeys
  end

    private

    attr_reader :journey

  def current_journey
  end

end
