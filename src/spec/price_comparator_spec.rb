require 'price_comparator'

describe PriceComparator do

  subject {PriceComparator.new}

  describe 'price comparator' do
    it 'Regular Rates: two weekdays' do
      reservation_date = 'Regular: 16Mar2009(mon), 17Mar2009(tues)'
      cheapest_hotel = subject.cheapest reservation_date
      expect(cheapest_hotel).to eq 'Lakewood'
    end

    it 'Rewards Rates: two weekends' do
      reservation_date = 'Rewards: 16Mar2009(sat), 17Mar2009(sun)'
      cheapest_hotel = subject.cheapest reservation_date
      expect(cheapest_hotel).to eq 'Ridgewood'
    end

    it 'Regular Rates: two weekdays and one weekend' do
      reservation_date = 'Regular: 26Mar2009(thur), 27Mar2009(fri), 28Mar2009(sat)'
      cheapest_hotel = subject.cheapest reservation_date
      expect(cheapest_hotel).to eq 'Lakewood'
    end

    it 'Regular Rates: one weekday and two weekends' do
      reservation_date = 'Regular: 26Mar2009(fri), 27Mar2009(sat), 28Mar2009(sun)'
      cheapest_hotel = subject.cheapest reservation_date
      expect(cheapest_hotel).to eq 'Bridgewood'
    end

    it 'Rewards Rates: two weekdays and two weekends' do
      reservation_date = 'Rewards: 26Mar2009(thur), 27Mar2009(fri), 28Mar2009(sat), 28Mar2009(sun)'
      cheapest_hotel = subject.cheapest reservation_date
      expect(cheapest_hotel).to eq 'Ridgewood'
    end



  end
end