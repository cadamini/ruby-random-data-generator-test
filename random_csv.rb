require_relative 'lib/range'
require_relative 'lib/input'
require_relative 'lib/normal_distribution'
require_relative 'lib/time_formatter'
# generate file for importer using > operator
# ruby random_csv.rb > filename.csv

class RandomCsv
  class << self
    def generate_output
      if ['help'].include?(ARGV[0]) || ARGV[0].nil?
        puts "\nRandom CSV File Creator\n\n"
        puts "Parameters:\n\n"
        puts "year, e.g. 2020"
        puts 'Example:'
        puts "ruby random_csv.rb 2020 \n\n"
        puts "Use > 'path/to/file' to generate a file."
        exit
      end

      inputs = Input.new
      range = Range.new(inputs.year)
      queue_name = "test"
      
      puts 'Queue;Date;Time;Offered;Handled;AHT;Channel' # header

      (range.start_date..range.end_date).each do |date|
        formatted_date = date.strftime('%d.%m.%Y')
        # build (random) Normal Distribution
        # Todo: Values should not be the same per week
        # weekly_volume = rand(12_000..13_500)
        calls_offered_distribution = NormalDistribution.new.day
        # for day
        # TODO: do not loop dates but build result array/hash/objects and output later
        0.upto(95) do |interval|
          offered = calls_offered_distribution[interval]
          aht = (rand(180..240) if offered != 0) || 0
          handled = (offered - rand(1..4) if offered > 4) || offered
          time_value = TimeFormatter.convert_minutes(interval * 15)

          puts "#{queue_name};#{formatted_date};#{time_value};#{offered};#{handled};#{aht};calls"
        end
        # special volumes for holidays

        # holidays should be different
        # def holiday_dates
        #   HolidayClient.new(
        #     start_date, end_date, region
        #   ).holidays.map { |h| h[1] }
        # end
        # if holiday_dates.include?(date)
        #   # build special day
      end
    end
  end
end

RandomCsv.generate_output
