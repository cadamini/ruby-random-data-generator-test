require 'distribution' # http://rubydoc.info/gems/distribution/0.7.0/Distribution/Normal/Ruby_

class NormalDistribution
  def initialize
    @rng = Distribution::Normal.rng(1, 10) # mean, standard_deviation
  end

  def day
    random_numbers = Array.new(96).map { @rng.call }
    random_numbers.each_with_index { |e, i| random_numbers[i] = (e**2).round }

    sorted_array = []
    sorted_array << random_numbers.max
    random_numbers.delete_at(random_numbers.index(random_numbers.max))

    random_numbers.sort!{ |a, b| b <=> a }.each_with_index do |value, idx|
      if idx.even?
        sorted_array.unshift(value)
      else
        sorted_array.push(value)
      end
    end
    sorted_array
  end
end
