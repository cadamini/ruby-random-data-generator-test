class OpeningHours
  def initialize(hours_array)
    @hours_array = hours_array
  end

  def opening
    @hours_array[0]
  end

  def closing
    @hours_array[1]
  end
end