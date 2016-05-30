require 'oystercard'

describe OysterCard do

  it 'has a balance' do
    expect(subject.balance).to eq 0
  end

  context '#top_up' do
    it 'responds to top_up method' do
      expect(subject).to respond_to(:top_up).with(1).argument
    end

    it 'tops up balance by requested amount' do
      expect{subject.top_up(10)}.to change{subject.balance}.by 10
    end

    it 'raises an error if you try and top up over the limit' do
      maximum_balance = OysterCard::MAXIMUM_BALANCE
      subject.top_up(maximum_balance)
      expect{subject.top_up(1)}.to raise_error "Maximum balance of #{maximum_balance} has been reached."
    end
  end

  # DEDUCT IS NOW PRIVATE
  # context '#deduct' do
  #   it 'responds to deduct method' do
  #     expect(subject).to respond_to(:deduct).with(1).argument
  #   end

  #   it 'deducts balance by requested amount' do
  #     subject.top_up(10)
  #     expect{subject.deduct(2)}.to change{subject.balance}.by -2
  #   end
  # end

  context '#in_journey?' do
    it 'initializes with false' do
      expect(subject).not_to be_in_journey
    end
  end

  context '#touch_in' do
    it 'changes in_journey to false' do
      subject.top_up(OysterCard::MINIMUM_BALANCE)
      subject.touch_in
      expect(subject).to be_in_journey
    end
    it 'raises error if not enough balance' do
      expect{subject.touch_in}.to raise_error "Not enough balance"
    end

  end

  context '#touch_out' do
    it 'changes in_journey to true' do
      subject.top_up(OysterCard::MINIMUM_CHARGE)
      subject.touch_in
      subject.touch_out
      expect(subject).not_to be_in_journey
    end

    it 'deducts the minimum fare from the balance' do
      minimum_charge = OysterCard::MINIMUM_CHARGE
      subject.top_up(minimum_charge)
      expect{subject.touch_out}.to change{subject.balance}.by -minimum_charge
    end

  end

end
