class Reservation
  @@name
  def price reservation_date
    date_hash = hash_date reservation_date
    if date_hash[:type].eql? 'Regular'
      price = date_hash[:weekend_count] * @weekend_regular + date_hash[:weekday_count] * @weekday_regular
    else
      price = date_hash[:weekend_count] * @weekend_rewards + date_hash[:weekday_count] * @weekday_rewards
    end
    price
  end

  private
  def hash_date date
    date_no_space = date.gsub(' ', '')
    customer_type = date_no_space.split(':')[0]

    reserve_dates = date_no_space.split(':')[1].split(',')

    week_date = Array.new
    reserve_dates.each do |reservation|
      week = reservation.split('(')[1]
      week_date << week.byteslice(0, week.length - 1)
    end

    weekday_count = 0
    weekend_count = 0
    week_date.each do |reservation_date|
      if ((reservation_date.eql? 'sat') || (reservation_date.eql? 'sun'))
        weekend_count += 1
      else
        weekday_count += 1
      end
    end

    date_hash = {:type => customer_type, :weekday_count => weekday_count, :weekend_count => weekend_count}
  end
end