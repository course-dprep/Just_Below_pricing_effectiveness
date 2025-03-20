GENDPREPTEMP = ../../gen/data-preparation/temp
GENDPREPOUTPUT = ../../gen/data-preparation/output

all: $(GENDPREPTEMP)/AmazonData.csv $(GENDPREPOUTPUT)/AmazonData.csv $(GENDPREPOUTPUT)/AmazonDataTop10.csv


## Clean the data
$(GENDPREPOUTPUT)/AmazonData.csv $(GENDPREPOUTPUT)/AmazonDataTop10.csv: $(GENDPREPTEMP)/AmazonData.csv Data_Cleaning.R
	R --vanilla < Data_Cleaning.R

## Download the data
$(GENDPREPTEMP)/AmazonData.csv: Data_Download.R
	R --vanilla < Data_Download.R

## Deletion of created csv and pdf files
wipe:
	@if exist "$(GENDPREPTEMP)\*.csv" cmd /c del /Q "$(GENDPREPTEMP)\*.csv"
	@if exist "$(GENDPREPOUTPUT)\*.csv" cmd /c del /Q "$(GENDPREPOUTPUT)\*.csv"
	@if exist "$(GENDPREPOUTPUT)\*.pdf" cmd /c del /Q "$(GENDPREPOUTPUT)\*.pdf"