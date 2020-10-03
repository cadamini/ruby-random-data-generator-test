# Random CSV data generator

This is the attempt to generate random CSV data.    
It creates data for a year. For the current year it generates data until today.

## Usage

`ruby random_csv.rb`

will show the context help which explains the usage

The script support a data parameter:  

`ruby random_csv.rb 2020`

### Generate CSV files

To generate a file use the > operator

`ruby random_csv.rb 2019 'en' 'Hotline' 10 20 > 'output_files/Hotline-2019.csv'`
