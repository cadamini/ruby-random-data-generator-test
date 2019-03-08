class IntervalValueRandomizer
  def initialize(sum, value)
    @sum = sum # rename
    @value = value # rename
  end

  def calls
    (@value * avg_per_interval * random_de_or_increase).floor
  end

  def handled_calls
    0
  end

  def aht
    return 0 if calls == 0
    (random_de_or_increase * avg_per_interval * random_de_or_increase + 100).floor
  end

  def avg_per_interval
    @sum / 96
  end

  def random_de_or_increase
    rand(0.96..1.1)
  end
end