all: data_preparation data_analysis final_paper

# Automated data preparation
data_preparation:
	make -C src/data-preparation

# Automated data analysis
data_analysis: data_preparation
	make -C src/analysis

# Automated paper generation
final_paper: final_paper
	make -C src/paper

# Delete everything
clean:
	R -e "unlink('gen', recursive = TRUE)"