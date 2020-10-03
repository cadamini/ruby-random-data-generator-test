require 'spec_helper.rb'
require 'time_formatter.rb'

RSpec.describe TimeFormatter do
  it 'builds a timestamp for interval' do
    expect(TimeFormatter.convert_minutes(15)).to eq '00:15'
  end
end
