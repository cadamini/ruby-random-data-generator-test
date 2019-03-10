# input: daily total and a distribution percentage
# output values per interval
class IntervalValueRandomizer
  def initialize(daily_total, distribution_factor)
    @daily_total = daily_total
    @distribution_factor = distribution_factor
  end

  def calls
    (@distribution_factor * average_value * random_modifier).floor
  end

  def handled_calls
    return 0 if calls.zero?

    calls - 3 || calls - 2
  end

  def aht
    return 0 if calls.zero?

    (random_modifier * average_value * random_modifier + 100).floor
  end

  private

  def average_value
    @daily_total / 96
  end

  def random_modifier
    rand(0.96..1.0)
  end
end
