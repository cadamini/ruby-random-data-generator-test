require_relative 'lib/range'
require_relative 'lib/input'
require_relative 'lib/normal_distribution'
require_relative 'lib/time_formatter'
require_relative 'lib/holiday_client'

class RandomCsv
  class << self
    def generate_output
      progress_help_param
      print_header
      output_file
    end

    def progress_help_param
      if ['help'].include?(ARGV[0]) || ARGV[0].nil?
        puts "\nRandom CSV File Creator\n\n"
        puts "Parameters:\n\n"
        puts "year, e.g. 2020"
        puts 'Example:'
        puts "ruby random_csv.rb 2020 \n\n"
        puts "Use > 'path/to/file' to generate a file."
        exit
      end
    end

    def print_header
      puts 'Queue;Date;Time;Offered;Handled;AHT;Channel'
    end

    def output_file
      range = Range.new

      (range.start_date..range.end_date).each do |date|
        date_de = date.strftime('%d.%m.%Y')

        call_distribution = NormalDistribution.new.day

        0.upto(95) do |interval|
          offered = call_distribution[interval]
          aht = (rand(180..240) if offered != 0) || 0
          handled = (offered - rand(1..4) if offered > 4) || offered
          time = TimeFormatter.convert_minutes(interval * 15)

          puts "Test;#{date_de};#{time};#{offered};#{handled};#{aht};calls"
        end
      end
    end

    # TODO: special volumes for holidays
    def holiday_dates
      range = Range.new
      # returns array of holiday date, currently only German holidays
      HolidayClient.new(
        range.start_date, range.end_date, 'de'
      ).holidays.map { |h| h[1] }
    end
  end
end

RandomCsv.generate_output
