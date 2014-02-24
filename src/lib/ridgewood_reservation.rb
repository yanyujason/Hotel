class RidgewoodReservation < Reservation

  def initialize
    @weekday_regular = 220
    @weekday_rewards = 100
    @weekend_regular = 150
    @weekend_rewards = 40
  end

  def name
    'Ridgewood'
  end
end