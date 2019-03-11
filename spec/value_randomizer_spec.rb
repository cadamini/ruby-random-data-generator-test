require 'spec_helper.rb'
require 'value_randomizer.rb'

RSpec.describe ValueRandomizer do
  
  let(:randomizer) { described_class.new(10000, 1) }

  it 'is a Randomizer' do 
  	expect(randomizer).to be_a ValueRandomizer
  end

  # fit it
  # by getting the same value as 
  # random_modifier

  it 'calculates offered calls' do 
  	allow(randomizer).to receive(:random_modifier).and_return 42
  	expect(randomizer.calls).to eq 4368
  end

  it 'calculates handled calls' do 
  	allow(randomizer).to receive(:random_modifier).and_return 42
  	expect(randomizer.handled_calls).to eq 4365
  end

  it 'calculates the aht' do 
  	allow(randomizer).to receive(:random_modifier).and_return 42
  	expect(randomizer.aht).to eq 183556
  end
end
