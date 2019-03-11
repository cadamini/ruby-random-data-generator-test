require_relative 'holiday_client'
require_relative 'distribution'
require_relative 'value_randomizer'
require_relative 'time_string_builder'
require_relative 'opening_hours'

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

  private 

  def output_csv_lines_for(date)
    if holiday_dates.include?(date)
      generate_output(
        date, rand(12_000..13_500),
        distribution.special_day, distribution.special_week
      )
    else
      generate_output(date, rand(13_500..14_500),
                      distribution.normal_day, distribution.normal_week)
    end
  end

  def holiday_dates
    HolidayClient.new(
      start_date, end_date, region
    ).holidays.map { |h| h[1] }
  end

  def header
    'Queue;Date;Time;CallsOffered;CallsHandled;AHT'
  end

  def generate_output(date, weekly_volume,
                      daily_distribution, weekly_destribution)
    daily_volume = weekly_destribution[date.wday] * weekly_volume
    daily_distribution.each_with_index do |value, interval|
      random = ValueRandomizer.new(daily_volume, value)
      time_string = TimeStringBuilder.create_for(interval)
      puts "#{queue_name};#{date.strftime('%d.%m.%Y')};#{time_string};" \
           "#{random.calls};#{random.handled_calls};#{random.aht}"
    end
  end

  def distribution
    Distribution.new(open_time: @opening_hours.opening,
                     close_time: @opening_hours.closing)
  end
end
