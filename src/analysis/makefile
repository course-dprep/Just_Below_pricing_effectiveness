GENANOUTPUT = ../../gen/analysis/output
GENDPREPOUTPUT = ../../gen/data-preparation/output

all: Preliminary_data_analysis Main_analysis Data_Exploration

## Perform data exploration
Data_Exploration: Data_Exploration.R $(GENDPREPOUTPUT)/AmazonData.csv
	R --vanilla < Data_Exploration.R

## Perform preliminary data analysis
Preliminary_data_analysis: Preliminary_data_analysis.R $(GENDPREPOUTPUT)/AmazonDataTop10.csv
	R --vanilla < Preliminary_data_analysis.R

## Perform main analysis
Main_analysis: Main_analysis.R $(GENDPREPOUTPUT)/AmazonDataTop10.csv
	R --vanilla < Main_analysis.R