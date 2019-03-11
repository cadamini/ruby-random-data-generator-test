require 'spec_helper.rb'
require 'export_date_range.rb'

RSpec.describe ExportDateRange do
  it 'returns an array with start and enddate' do
    expect(ExportDateRange.for(2018)).to eq [
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
      ExportDateRange.for(current_year)
    ).to eq expected_result
  end
end
