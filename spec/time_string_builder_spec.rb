require 'spec_helper.rb'
require 'time_string_builder.rb'

RSpec.describe TimeStringBuilder do
  it 'builds a timestamp for interval' do 
  	expect(TimeStringBuilder.create_for(15)).to eq "00:15"
  end
end
