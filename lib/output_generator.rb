require_relative 'line_builder'

class OutputGenerator
  attr_reader :queue, :start_date, :end_date, :region, :queue_name, :opening_hours

  def initialize(start_date:, end_date:, region:, queue_name:, opening_hours:)
    @region = region
    @start_date = start_date
    @end_date = end_date
    @queue_name = queue_name
    @opening_hours = opening_hours
    @queue = queue
  end

  def run
    OutputPrinter.header
    (start_date..end_date).each do |date|
      LineBuilder.new(queue_name, date, opening_hours, holiday_dates).generate
    end
  end

  private

  def holiday_dates
    HolidayClient.new(
      start_date, end_date, region
    ).holidays.map { |h| h[1] }
  end
end
