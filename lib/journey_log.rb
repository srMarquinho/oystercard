require_relative 'journey'

class JourneyLog

attr_reader :past_journeys

  def initialize
    @past_journeys = []
    @current_journey = []
	end

  def start_log(entry_station)
    @journey = Journey.new
    @current_journey << entry_station
    journey.start(entry_station)
  end

  def finish_log(exit_station)
    @journey = Journey.new unless journey
    @current_journey << exit_station
    @past_journeys <<  @current_journey
    journey.finish(exit_station)
  end

    private

    attr_reader :journey



end
