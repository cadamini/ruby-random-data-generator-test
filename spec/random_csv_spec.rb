require 'spec_helper.rb'
require_relative '../random_csv.rb'

RSpec.describe RandomCsv do 

  it 'gets a parameter hash' do
    params_hash = { 
      region: 'de',
      start_date: Date.new(2019,1,1), 
      end_date: Date.new(2019,1,1),
      interval: 15, 
      queue_name: 'Test-Queue',
      opening_hours: [8,18] 
    }
  
    input = InputParameters.new(parameters: params_hash).parameters
 
    expect(OutputGenerator.new(input).run).to eq ["Test-Queue", "01.01.2019", "00:00", 0, 0, 0]
  end

  it 'accepts 5 parameters' do 
  end

  it 'shows with context help without parameters' do 
  end

end

