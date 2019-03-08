class Distribution
  def initialize
    # should contain e.g. a factor
    # or opening hours
  end

  def normal_week
    [0.2, 0.3, 0.11, 0.09, 0.3, 0, 0]  
  end

  def special_week
    [0.1, 0.1, 0.5, 0.00, 0.2, 0.1, 0] 
  end

  # Currently number of intervals show different opening times
  def normal_day
    Array.new(32) {0} + [
      0.1, 0.3, 0.7, 0.9, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 
      1, 1.5, 2, 2, 2.28, 2, 2, 1.7, 1.5, 1.4, 1.1, 1, 1, 1, 1, 1, 1, 0.7, 0.4, 0.2
    ] + Array.new(32) {0}
  end

  def special_day
    # todo: refactor looping day was not updating values, fix it.
    Array.new(32) {0} + [
      3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 
       3, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    ] + Array.new(32) {0}
  end
end