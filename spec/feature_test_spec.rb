require_relative '../lib/oystercard'

describe 'FEATURE TEST:' do
  it 'Tops up card' do
    my_card = Oystercard.new
    my_card.top_up(5)
  end

  it 'Touches in and then out' do
    my_card = Oystercard.new
    my_card.top_up(5)
    my_card.touch_in(:london_bridge)
    my_card.touch_out(:camdem)
  end

  it 'Temembers the entry station when touches in' do
    my_card = Oystercard.new
    my_card.top_up(50)
    my_card.touch_in(:london_bridge)
    p "After first touch in #{my_card.balance}"
    my_card.touch_in(:angel)
    p "After second touch in #{my_card.balance}"
    my_card.touch_in(:oxford_circus)
    p "After third touch in #{my_card.balance}"
    my_card.touch_out(:euston)
    p "After first touch out #{my_card.balance}"
    p my_card.journey_log.past_journeys
  end
end
