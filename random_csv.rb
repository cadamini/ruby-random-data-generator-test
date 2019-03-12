require_relative 'lib/export_date_range'
require_relative 'lib/output_generator'

# generate file for importer using > operator
# ruby random_csv.rb > filename.csv

class RandomCsv
  class << self
    def generate_output
      start_date, end_date = ExportDateRange.for(year)
      if ['help'].include?(ARGV[0]) || ARGV[0].nil?
        puts "\nRandom CSV File Creator\n\n"
        puts "Run this tool with 4 parameters!\n\n"
        puts "YEAR, e.g. #{Date.today.year+1}, default: #{Date.today.year}"
        puts "REGION, e.g. 'de', 'uk' or 'us', default: 'de'"
        puts "QUEUE NAME, e.g. Hotline, default: 'Test-Queue'"
        puts 'OPENINGS START time, e.g. 10 default: 8'
        puts 'OPENINGS END time, e.g. 20, default: 18'
        puts 'INTERVAL, e.g. 30, default: 15'
        puts ''
        puts 'Example:'
        puts "ruby random_csv.rb #{Date.today.year} 'en' 'Hotline' 10 20\n\n" 
        exit
      end
      
      OutputGenerator.new(
        region: region,
        start_date: start_date,
        end_date: end_date,
        interval: ARGV[5].to_i > 0 ? ARGV[5].to_i : 15,
        queue_name: ARGV[2] || 'Test-Queue',
        opening_hours: [ARGV[3].to_i, ARGV[4].to_i] || [8,18]
      ).run
    end

    private

    def year
      ARGV[0].to_i > 0 ? ARGV[0].to_i : Date.today.year
    end

    def region
      !ARGV[1].nil? ? ARGV[1] : 'de'
    end
  end
end

RandomCsv.generate_output
