GENPAPOUTPUT = ../../gen/paper/output

## Write paper
Final_paper.pdf: Final_paper.Rmd
	Rscript -e "rmarkdown::render('Final_paper.Rmd', output_format='pdf_document', output_file='Final_paper.pdf', output_dir = '$(GENPAPOUTPUT)')"