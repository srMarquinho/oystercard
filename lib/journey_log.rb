require_relative 'journey'

class JourneyLog

attr_reader :past_journeys

  def initialize
    @past_journeys = []
    @current_journey = []
	end

  def start_log(entry_station)
    no_touch_out if journey
    @journey = Journey.new
    @current_journey << entry_station
    fare = journey.start(entry_station)
    @penalty ? fare : 0
  end

  def finish_log(exit_station)
    no_touch_in unless journey
    @current_journey << exit_station
    @past_journeys <<  @current_journey
    fare = journey.finish(exit_station)
    journey = nil
    fare
  end

    private

    attr_reader :journey

    def no_touch_in
      @journey = Journey.new
      @current_journey << nil
    end

    def no_touch_out
      @current_journey << nil
      @past_journeys << @current_journey
      @current_journey = []
      @penalty = true
      @journey = nil
    end

end
