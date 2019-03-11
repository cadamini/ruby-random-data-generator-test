require 'spec_helper.rb'
require 'time_string_builder.rb'

RSpec.describe TimeStringBuilder do
  it 'builds a timestamp for interval' do 
  	expect(TimeStringBuilder.create_for(1)).to eq "00:15"
  end

  it 'raises an error if value smaller 0 or greater 96' do 
  	[-1, 97].each do |value|
  	  expect { TimeStringBuilder.create_for(value) }.to raise_error ArgumentError
  	end
  end
end
