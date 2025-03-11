all: data_preparation data_analysis 

# Automated data preparation
data_preparation:
	make -C src/data-preparation

# Automated data analysis
data_analysis: data_preparation
	make -C src/analysis
	
wipe: 
	-rm -r gen