require_relative 'holiday_client'
require_relative 'distribution'

class OutputDataGenerator
  attr_reader :queue, :start_date, :end_date

  def initialize(start_date:, end_date:)
    @start_date = start_date
    @weekly_volume = rand(12_000..13_500)
    @end_date = end_date
  end

  def generate
    puts 'Queue;Date;Time;CallsOffered;CallsHandled;AHT'
    (start_date..end_date).each do |date|
      #if holiday_dates.include?(date)
      #  build(DailyDistribution.special, WeeklyDistribution.special, date)
      #else
      build(DailyDistribution.normal, WeeklyDistribution.normal, date)
      #end
    end
  end

  private
  
  # def holiday_dates
  #   HolidayClient.new(
  #     start_date, end_date, 'de'
  #   ).holidays.map { |h| h[1] }
  # end

  def build(daily_distribution, weekly_distribution, date)
    daily_distribution.each_with_index do |value, raster|
    # value, weekly_distribution[@date.wday] * @weekly_volume, daily_volume
      puts "Test Queue;#{date.strftime('%d.%m.%Y')};" \
           "#{timestring(15 * raster)};" \
           "#{value};100;250"
    end
  end

  def timestring(minutes)
    hours = minutes / 60
    time = Time.new(2001, 1, 1, hours, minutes % 60, 0)
    time.strftime('%H:%M')
  end
end


