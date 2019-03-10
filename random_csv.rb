require_relative 'lib/export_date_range'
require_relative 'lib/output_generator'

# generate file for importer using > operator
# ruby random_csv.rb > filename.csv

class RandomCsv
  class << self
    def generate_output
      start_date, end_date = ExportDateRange.for(first_argument_or_default_year)
      OutputGenerator.new(
        region: second_argument_or_default,
        start_date: start_date,
        end_date: end_date,
        queue_name: ARGV[2] || 'Test',
        opening_hours: ARGV[3] || [8, 16]
      ).run
    end

    private

    def first_argument_or_default_year
      ARGV[0].to_i > 0 ? ARGV[0].to_i : default_year
    end

    def second_argument_or_default
      !ARGV[1].nil? ? ARGV[1] : default_region
    end

    def default_region
      'de'
    end

    def default_year
      Date.today.year
    end
  end
end

RandomCsv.generate_output
