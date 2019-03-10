require 'spec_helper'
require_relative '../script'

RSpec.describe Script do
  context 'data generation' do
    it 'generates an array with 48 elements' do
      expect(Script.new.base).to eq Array.new(48)
    end

    it 'knows percentages per interval' do
      expect(Script.new.percentages).to eq [
        0.18,
        0.39,
        1.36,
        2.89,
        4.40,
        5.01,
        5.22,
        6.20,
        6.31,
        6.19,
        5.94,
        6.01,
        5.31,
        5.50,
        5.34,
        5.25,
        4.55,
        4.26,
        4.22,
        4.06,
        3.51,
        3.05,
        2.59,
        2.14,
        0.11
      ]
    end

    it 'calculates a percentage from an input value' do
    end
  end
end
