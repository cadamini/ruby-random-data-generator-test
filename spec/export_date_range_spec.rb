require 'spec_helper.rb'
require 'export_date_range.rb'

RSpec.describe ExportDateRange do
  it 'returns an array with start and enddate' do
    date_range = ExportDateRange.new(year: 2018)
    expect(date_range.start_date).to eq [
      Date.new(2018, 1, 1), Date.new(2018, 12, 31)
    ]
  end

  it 'returns yesterday as enddate for current year' do
    current_year = Date.today.year
    expected_result = [
      Date.new(2019, 1, 1),
      Date.new(2019, Date.today.month, Date.today.day - 1)
    ]
    expect(
      ExportDateRange.new(year: current_year)
    ).to eq expected_result
  end
end
