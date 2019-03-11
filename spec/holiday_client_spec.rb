require 'spec_helper.rb'
require 'holiday_client.rb'
require 'holidays'

RSpec.describe HolidayClient do
  let(:client) do
    described_class.new(
      Date.new(2018, 1, 1), Date.new(2018, 12, 31), 'de'
    )
  end
  it 'accepts a startdate, enddate and country_code' do
    expect(client).to be_a HolidayClient
  end

  it 'gets holiday hash for the requested year' do
    expect(client.holidays.keys.first).to eq 'Neujahrstag'
  end
end
