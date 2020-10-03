class TimeFormatter
  def self.convert_minutes(minutes)
    hours = minutes / 60
    time = Time.new(2001, 1, 1, hours, minutes % 60, 0)
    time.strftime('%H:%M')
  end
end
