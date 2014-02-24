require 'reservation'
require 'lakewood_reservation'
require 'bridgewood_reservation'
require 'ridgewood_reservation'

class PriceComparator

  def initialize
    @lakewood = LakewoodReservation.new
    @bridgewood = BridgewoodReservation.new
    @ridgewood = RidgewoodReservation.new
    @all_hotel = [@lakewood, @bridgewood, @ridgewood]
  end

  def cheapest reservation_date
    cheapest_hotel = @all_hotel.min do |a, b|
      (a.price reservation_date) <=> (b.price reservation_date)
    end

    cheapest_hotel.name
  end
end