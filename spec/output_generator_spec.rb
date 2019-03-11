require 'spec_helper.rb'
require 'output_generator.rb'

RSpec.describe OutputGenerator do
end

RSpec.describe OpeningHours do

	let(:opening_hours) { OpeningHours.new([5,8]) }

	it 'gets an array with integers as hours' do
		expect(opening_hours).to be_a OpeningHours
	end

	it 'get the opening hour' do
	  expect(opening_hours.opening).to eq 5
  end

	it 'get the closing hour' do
	  expect(opening_hours.closing).to eq 8
	end
end

