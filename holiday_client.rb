require 'holidays'

class HolidayClient
  attr_reader :startdate, :enddate

  def initialize(startdate, enddate, country_code)
    @startdate = startdate
    @enddate = enddate
    @country_code = country_code
  end

  def holidays
    holidays = {}
    holidays_between.each do |holiday|
      holidays[holiday[:name]] = holiday[:date]
    end
    holidays
  end

  private

  def holiday_regions
    Holidays.available_regions.select do |region|
      region.to_s.start_with?(@country_code)
    end
  end

  def holidays_between
    Holidays.cache_between(
      startdate, startdate.next_year(1) - 1, *holiday_regions, :informal, :observed
    ).values.flatten
  end
end
