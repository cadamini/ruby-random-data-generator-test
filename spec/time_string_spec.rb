require 'spec_helper.rb'
require 'time_string.rb'

RSpec.describe TimeString do
  it 'builds a timestamp for interval' do
    expect(TimeString.create_for(15)).to eq '00:15'
  end
end
