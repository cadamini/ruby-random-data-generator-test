require_relative 'holiday_client'
require_relative 'distribution'
require_relative 'opening_hours'
require_relative 'output_printer'

class LineBuilder
  attr_reader :queue, :holiday_dates, :date, :interval

  def initialize(queue, date, opening_hours, interval, holiday_dates)
    @date = date
    @weekly_volume = rand(12_000..13_500)
    @opening_hours = OpeningHours.new(opening_hours)
    @holiday_dates = holiday_dates
    @interval = interval
    @queue = queue
  end

  def generate
    if holiday_dates.include?(date)
      build(distribution.special_day, distribution.special_week)
    else
      build(distribution.normal_day, distribution.normal_week)
    end
  end

  private

  def build(daily_distribution, weekly_distribution)
    daily_distribution.each_with_index do |value, raster|
      OutputPrinter.line(
        queue, date, interval, raster, value, daily_volume(weekly_distribution)
      )
    end
  end

  def daily_volume(weekly_distribution)
    weekly_distribution[@date.wday] * @weekly_volume
  end

  def distribution
    Distribution.new(open_time: @opening_hours.opening,
                     close_time: @opening_hours.closing,
                     interval: interval)
  end
end
