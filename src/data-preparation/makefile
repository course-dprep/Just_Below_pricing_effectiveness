GENDPREPTEMP = ../../gen/data-preparation/temp
GENDPREPOUTPUT = ../../gen/data-preparation/output

all: $(GENDPREPTEMP)/AmazonData.csv $(GENDPREPOUTPUT)/AmazonData.csv $(GENDPREPOUTPUT)/AmazonDataTop10.csv $(GENDPREPOUTPUT)/Data_Exploration.pdf

## Explore the data
$(GENDPREPOUTPUT)/Data_Exploration.pdf: Data_Exploration.Rmd $(GENDPREPOUTPUT)/AmazonData.csv
	Rscript -e "rmarkdown::render('Data_Exploration.Rmd', output_format='pdf_document', output_file='$(GENDPREPOUTPUT)/Data_Exploration.pdf')"


## Clean the data
$(GENDPREPOUTPUT)/AmazonData.csv $(GENDPREPOUTPUT)/AmazonDataTop10.csv: $(GENDPREPTEMP)/AmazonData.csv Data_Cleaning.Rmd
	Rscript -e "rmarkdown::render('Data_Cleaning.Rmd')"

## Download the data
$(GENDPREPTEMP)/AmazonData.csv: Data_Download.Rmd
	Rscript -e "rmarkdown::render('Data_Download.Rmd')"

## Deletion of created csv and pdf files
wipe:
	@if exist "$(GENDPREPTEMP)\*.csv" cmd /c del /Q "$(GENDPREPTEMP)\*.csv"
	@if exist "$(GENDPREPOUTPUT)\*.csv" cmd /c del /Q "$(GENDPREPOUTPUT)\*.csv"
	@if exist "$(GENDPREPOUTPUT)\*.pdf" cmd /c del /Q "$(GENDPREPOUTPUT)\*.pdf"