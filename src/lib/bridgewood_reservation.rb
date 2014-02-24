class BridgewoodReservation < Reservation

  def initialize
    @weekday_regular = 160
    @weekday_rewards = 110
    @weekend_regular = 60
    @weekend_rewards = 50
  end

  def name
    'Bridgewood'
  end
end