class WeeklyDistribution
  class << self
    def normal # idx 0 = sunday
      
      # setup // distribution base?
      # extract
      intervals_per_hour = 60 / 15
      number_of_intervals = 1440 / 15

      week = Array.new(7) { 0 }
      d = 1.0 / 7
      daily_factors = [0, d + 0.1, d + 0.12, d + 0.15, d - 0.02, d - 0.03, 0]
      daily_factors.each_with_index { |factor, i| week[i] = factor.round(2) }
      week
    end
    # TODO: define special distributions for holiday weeks
  end
end

class DailyDistribution
  class << self
    def normal

      # SETUP
      # extract
      open_time = 8
      close_time = 16
      intervals_per_hour = 60 / 15
      number_of_intervals = 1440 / 15
      open_from = open_time * intervals_per_hour
      closed_at = close_time * intervals_per_hour
      
      # calculate random number
      day = Array.new(number_of_intervals) {0}
      # fixed 8-16, utc
      (32..64).each do |i| 
        day[i] = (1.1 * rand() * 100).round(0)
      end

      # split and sort
      sorted_day = []
      day = day.each_slice(48)
      day.each_with_index do |array, idx|
        sorted_day << array.sort if idx == 0; 
        sorted_day << array.sort.reverse if idx == 1;  
      end
      
      sorted_day.flatten.each_with_index do |value, raster|
        day[raster] = value
      end    
      day
    end
    # TODO: define special distributions for holidays
  end
end
