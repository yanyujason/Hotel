require 'reservation'
require 'lakewood_reservation'

describe LakewoodReservation do
  subject {LakewoodReservation.new}

  describe 'reservation rates calculation' do
    context 'weekday days only' do
      it 'two weekday days with regular rate' do
        reservation_date = 'Regular: 16Mar2009(mon), 17Mar2009(tues)'
        price = subject.price reservation_date
        expect(price).to eq 220
      end

      it 'two weekday days with rewards rate' do
        reservation_date = 'Rewards: 16Mar2009(mon), 17Mar2009(tues)'
        price = subject.price reservation_date
        expect(price).to eq 160
      end
    end

    context 'weekend days only' do
      it 'two weekend days with regular rates' do
        reservation_date = 'Regular: 16Mar2009(sat), 17Mar2009(sun)'
        price = subject.price reservation_date
        expect(price).to eq 180
      end

      it 'two weekend days with rewards rate' do
        reservation_date = 'Rewards: 16Mar2009(sat), 17Mar2009(sun)'
        price = subject.price reservation_date
        expect(price).to eq 160
      end
    end

    context 'mixture of weekdays and weekend' do
      it 'one weekday and one weekend with regular rate' do
        reservation_date = 'Regular: 16Mar2009(fri), 17Mar2009(sat)'
        price = subject.price reservation_date
        expect(price).to eq 200
      end

      it 'one weekday and one weekend with rewards rate' do
        reservation_date = 'Rewards: 16Mar2009(fri), 17Mar2009(sat)'
        price = subject.price reservation_date
        expect(price).to eq 160
      end

      it 'two weekdays and two weekends with rewards rate' do
        reservation_date = 'Rewards: 26Mar2009(thur), 27Mar2009(fri), 28Mar2009(sat), 28Mar2009(sun)'
        price = subject.price reservation_date
        expect(price).to eq 320
      end
    end
  end

  describe 'get name' do
    it 'should return Lakewood as the name' do
      expect(subject.name).to eq 'Lakewood'
    end
  end
end