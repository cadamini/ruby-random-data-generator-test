require 'date'

class ExportDateRange
  attr_reader :year, :start_date, :end_date

  def initialize(year:)
    @year = year
    @start_date = Date.new(year, 1, 1)
    @end_date = this_year? ? until_yesterday : complete_year
  end

  private

  def this_year?
    year == Date.today.year
  end

  def until_yesterday
    Date.new(year, Date.today.month, Date.today.day - 1)
  end

  def complete_year
    Date.new(year, 12, 31)
  end
end

