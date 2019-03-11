class TimeStringBuilder
  def self.create_for(minutes)
    hours = minutes / 60
    time = Time.new(2001, 1, 1, hours, minutes % 60, 0)
    time.strftime('%H:%M')
  end
end
