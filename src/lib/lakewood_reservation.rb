class LakewoodReservation < Reservation

  def initialize
    @weekday_regular = 110
    @weekday_rewards = 80
    @weekend_regular = 90
    @weekend_rewards = 80
  end

  def name
    'Lakewood'
  end

end