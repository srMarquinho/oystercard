

require_relative '../lib/oystercard'

describe 'Feature test' do
  it 'tops up card' do
    my_card = Oystercard.new
    my_card.top_up(5)
  end

  # it 'touches in' do
  #   my_card = Oystercard.new
  #   my_card.top_up(5)
  #   my_card.touch_in
  # end

  it 'remembers the entry station after touch in' do
    my_card = Oystercard.new

    my_card.top_up(5)

    #my_card.touch_in(:london_bridge)


  end







end
