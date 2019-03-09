require_relative 'export_date_range'
require_relative 'output_generator'

# generate file for importer by running 
# ruby script.rb > filename.csv

def first_arg_or_actual_year
	ARGV[0].to_i > 0 ? ARGV[0].to_i : Date.today.year  
end

def second_param_or_german_holidays
	ARGV[1] != nil ? ARGV[1] : 'de'
end

start_date, end_date = ExportDateRange.for(first_arg_or_actual_year)

OutputGenerator.new(
	region: second_param_or_german_holidays, 
	start_date: start_date, 
	end_date: end_date,
	queue_name: ARGV[2] || 'Test',
	opening_hours: ARGV[3] || [8,16]
).run