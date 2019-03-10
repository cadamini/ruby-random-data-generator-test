require_relative 'holiday_client'
require_relative 'distribution'
require_relative 'interval_value_randomizer'

class OpeningHours
  def initialize(hours_array)
    @hours_array = hours_array
  end

  def open
    @hours_array[0]
  end

  def close
    @hours_array[1]
  end
end

class OutputGenerator
  attr_reader :start_date, :end_date, :region, :queue_name

  def initialize(start_date:, end_date:, region:, queue_name:, opening_hours:)
    @region = region
    @start_date = start_date
    @end_date = end_date
    @queue_name = queue_name
    @opening_hours = OpeningHours.new(opening_hours)
  end

  def run
    puts header

    (start_date..end_date).each do |date|
      output_csv_lines_for(date)
    end
  end

  def output_csv_lines_for(date)
    if holiday_dates.include?(date)
      generate_output(date, rand(12_000..13_500), distribution.special_day, distribution.special_week)
    else
      generate_output(date, rand(13_500..14_500), distribution.normal_day, distribution.normal_week)
      end
  end

  def holiday_dates
    dates ||= HolidayClient.new(start_date, end_date, region).holidays.map { |h| h[1] }
  end

  private

  def build_time_string(interval)
    time_in_minutes = interval * 15
    hours = time_in_minutes / 60
    minutes = time_in_minutes * 60 / 60 % 60
    time = Time.new(2001, 1, 1, hours, minutes, 0)
    time.strftime('%H:%M')
  end

  def header
    'Queue;Date;Time;CallsOffered;CallsHandled;AHT'
  end

  def generate_output(date, weekly_volume, daily_distribution, weekly_destribution)
    daily_volume = weekly_destribution[date.wday] * weekly_volume
    daily_distribution.each_with_index do |value, interval|
      random_value = IntervalValueRandomizer.new(daily_volume, value)
      time_string = build_time_string(interval)
      puts "#{queue_name};#{date.strftime('%d.%m.%Y')};#{time_string};#{random_value.calls};#{random_value.handled_calls};#{random_value.aht}"
    end
  end

  def distribution
    Distribution.new(open_time: @opening_hours.open, close_time: @opening_hours.close)
  end
end
