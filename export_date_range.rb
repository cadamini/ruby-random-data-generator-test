require 'date'

class ExportDateRange

  def self.for(year)
    return start_date(year), end_date(year)
  end

  private 

  def self.start_date(year)
    Date.new(year,1,1)
  end

  def self.end_date(year)
    if this_year?(year)
      Date.new(year, Date.today.month, Date.today.day-1)
    else
      Date.new(year,12,31)
    end
  end

  def self.this_year?(year)
    year == Date.today.year
  end
end