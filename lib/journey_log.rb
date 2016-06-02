require_relative 'journey'

class JourneyLog

  def initialize(journey_class = Journey)
    @journey_class = journey_class
	end

  def start(entry_station)
    @journey_class.new(entry_station)
    #@current_journey << #journey.start(entry_station)
  end

  def finish
    #@journeys <<#@current_journey << journey.finish(exit_station)
  end

  def journeys
  end

    private

  def current_journey
  end


end
