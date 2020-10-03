require 'date'

class Range
  attr_reader :year, :start_date, :end_date

  def initialize(year)
    @year = year.to_i
  end

  def start_date
    Date.new(year, 1, 1)
  end

  def end_date
    if this_year?(year)
      Date.new(year, Date.today.month, Date.today.day)
    else
      Date.new(year, 12, 31)
    end
  end

  private

  def this_year?(year)
    year == Date.today.year
  end
end
