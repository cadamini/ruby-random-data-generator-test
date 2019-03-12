# Random CSV data generator 

This is the attempt to generate random csv data

It creates data for the complete year for past years. 

For the current year it generates data until yesterday. 

## Usage

`ruby random_csv.rb`

will show the context help which explains the usage

### Parameters

You need to use them in the following order

YEAR, e.g. 2020, default: 2019
REGION, e.g. 'de', 'uk' or 'us', default: 'de'
QUEUE NAME, e.g. Hotline, default: 'Test-Queue'
OPENINGS START time, e.g. 10 default: 8
OPENINGS END time, e.g. 20, default: 18
INTERVAL, e.g. 30, default: 15

### Example

ruby random_csv.rb 2019 'en' 'Hotline' 10 20

### Minimal parameter set 

For the current year, German holidays, openings 8 - 18 and 15 minutes intervals
you can use simply

`ruby random_csv.rb 2019` 

If you want to output anything else, you need to enter all parameters.

### Generate CSV files 

To generate a file use the > operator

`ruby random_csv.rb 2019 'en' 'Hotline' 10 20 > 'output_files/Hotline-2019.csv'` 