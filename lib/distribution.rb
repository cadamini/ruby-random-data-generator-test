class Distribution
  attr_writer :day

  def initialize(open_time:, close_time:)
    @start_hour = open_time * 4
    @end_hour = close_time * 4
    @day = Array.new(96) { 0 }
    @week = Array.new(7) { 0 }
  end

  def normal_week
    d = 1.0 / 7
    daily_factors = [d + 0.1, d + 0.12, d + 0.15, d - 0.02, d - 0.03, 0, 0]
    daily_factors.each_with_index { |factor, i| @week[i] = factor.round(2) }
    @week
  end

  def special_week
    d = 1.0 / 7
    daily_factors = [d + 0.14, d, d + 0.09, d, d, 0, 0]
    daily_factors.each_with_index { |factor, i| @week[i] = factor.round(2) }
    @week
  end

  def normal_day
    # idea. quadrat function, e.g. (2 * (interval * interval) + 1) / 100 end
    (@start_hour..@end_hour).each { |interval| @day[interval] = 1.1 }
    @day
  end

  def special_day
    (@start_hour..@end_hour).each { |interval| @day[interval] = 1 }
    @day
  end
end
