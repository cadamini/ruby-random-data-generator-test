require 'spec_helper.rb'
require 'output_generator.rb'
require 'holiday_client'

RSpec.describe OutputGenerator do
  let(:generator) do
    OutputGenerator.new(
      start_date: Date.today, end_date: Date.today,
      region: 'de', queue_name: 'Test',
      opening_hours: [5, 6],
      interval: 15
    )
  end

  it 'is an OutputGenerator' do
    expect(generator).to be_a OutputGenerator
  end

  # TODO: extend tests here
end
