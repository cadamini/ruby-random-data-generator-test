require 'spec_helper.rb' 
require 'distribution'

RSpec.describe Distribution do

	let(:distribution) { distribution = Distribution.new(open_time: 4, close_time: 5) }
	
	it 'is a distribution' do 
		expect(distribution).to be_a Distribution
	end

	it 'returns a normal week' do 
		result_distribution = [0.24, 0.26, 0.29, 0.12, 0.11, 0, 0]
		expect(distribution.normal_week).to eq result_distribution
	end



	it 'returns a normal day' do
		(16..20).each do |i|
		  expect(distribution.normal_day[i]).to be > 0
		 end
    end

    describe '#special week' do
	    it 'returns a special week' do 
			result_distribution = [0.28, 0.14, 0.23, 0.14, 0.14, 0, 0]
			expect(distribution.special_week).to eq result_distribution
		end
	end

	describe '#special day' do 
	    it 'has a value > 0 within opening times' do
	    	(16..20).each do |i|
	    	  expect(distribution.special_day[i]).to eq 1
	    	end
	    end

	    it 'has a value == 0 outside opening times' do
	    	[15, 21].each do |i|
	    	  expect(distribution.special_day[i]).to eq 0
	    	end
	   	end
	end

	describe '#normal day' do 
	    it 'has a value > 0 within opening times' do
	    	(16..20).each do |i|
	    	  expect(distribution.normal_day[i]).to eq 1.1
	    	end
	    end

	    it 'has a value == 0 outside opening times' do
	    	[15, 21].each do |i|
	    	  expect(distribution.normal_day[i]).to eq 0
	    	end
	   	end
	end
end