GENANOUTPUT = ../../gen/analysis/output
GENDPREPOUTPUT = ../../gen/data-preparation/output

all: $(GENANOUTPUT)/Preliminary_data_analysis.pdf $(GENANOUTPUT)/Main_analysis.pdf

## Perform preliminary data analysis
$(GENANOUTPUT)/Preliminary_data_analysis.pdf: Preliminary_data_analysis.Rmd $(GENDPREPOUTPUT)/AmazonData.csv
	Rscript -e "rmarkdown::render('Preliminary_data_analysis.Rmd', output_format='pdf_document', output_file='$(GENANOUTPUT)/Preliminary_data_analysis.pdf')"

## Perform main analysis
$(GENANOUTPUT)/Main_analysis.pdf: Main_analysis.Rmd $(GENDPREPOUTPUT)/AmazonData.csv
	Rscript -e "rmarkdown::render('Main_analysis.Rmd', output_format='pdf_document', output_file='$(GENANOUTPUT)/Main_analysis.pdf')"