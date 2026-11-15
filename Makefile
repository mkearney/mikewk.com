# Build and preview the site. Requires Hugo (extended) >= 0.128.
# R Markdown posts (content/post/*.Rmd) are rendered to .html with blogdown first: `make rmd`.
HUGO ?= hugo

.PHONY: build serve rmd clean

## Rebuild the published site in docs/ (served by GitHub Pages).
build:
	$(HUGO) --gc --cleanDestinationDir

## Local preview with live reload at http://localhost:1313
serve:
	$(HUGO) server --buildDrafts --renderToMemory

## Re-knit changed R Markdown posts to HTML.
rmd:
	Rscript -e 'blogdown::build_site(build_rmd = "newfile")'

clean:
	rm -rf docs/* resources/ .hugo_build.lock
