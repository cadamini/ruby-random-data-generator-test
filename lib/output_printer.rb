require_relative 'value_randomizer'
require_relative 'time_string_builder'

class OutputPrinter
  class << self
    def header
      puts 'Queue;Date;Time;CallsOffered;CallsHandled;AHT'
    end

    def line(queue_name, date, interval, raster, value, daily_volume)
      random = random_value(daily_volume, value)
      puts "#{queue_name};#{date.strftime('%d.%m.%Y')};" \
           "#{time_string(interval * raster)};" \
           "#{random.calls};#{random.handled_calls};#{random.aht}"
    end

    def time_string(minutes)
      TimeStringBuilder.create_for(minutes)
    end

    def random_value(daily_volume, value)
      ValueRandomizer.new(daily_volume, value)
    end
  end
end
