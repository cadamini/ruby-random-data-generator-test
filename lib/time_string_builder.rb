class TimeStringBuilder
  def self.create_for(interval)
    time_in_minutes = interval * 15
    hours = time_in_minutes / 60
    minutes = time_in_minutes * 60 / 60 % 60
    time = Time.new(2001, 1, 1, hours, minutes, 0)
    time.strftime('%H:%M')
  end
end