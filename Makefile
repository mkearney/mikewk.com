.PHONY: all clean
all:
	@echo Build all
	Rscript -e 'blogdown::hugo_build()'
	Rscript -e 'browseURL("http://localhost:1313/")'
	hugo server
clean:
	@echo Clean all
	rm -rf docs/*
