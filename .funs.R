format_yaml <- function(params) {
  knitr_chunk <- "
```{r setup, include=FALSE}
knitr::opts_chunk$set(collapse = TRUE)
```
"
  params <- paste0(names(params), ": ", params)
  params <- c("---", params, "---\n", knitr_chunk)
  paste(params, collapse = "\n")
}

new_post <- function(title,
                     author = "mwk",
                     date = Sys.Date(),
                     slug = NULL,
                     categories = NULL,
                     tags = NULL) {
  op <- options()
  on.exit(options(op))
  options(useFancyQuotes = FALSE)
  if (is.null(slug)) {
    slug <- gsub(" ", "-", tolower(title))
  }
  params <- list(
    title = dQuote(title),
    author = dQuote(author),
    date = dQuote(date),
    slug = slug,
    categories = format_json(categories),
    tags = format_json(tags)
  )
  yaml <- format_yaml(params)
  saveas <- paste0(Sys.Date(), "-", slug, ".Rmd")
  saveas <- file.path("content", "post", saveas)
  cat(yaml, file = saveas, fill = TRUE)
  browseURL(saveas, browser = "open -a emacs")
}

format_json <- function(x = NULL) {
  if (is.null(x)) return("")
  x <- dQuote(x)
  x <- paste(x, collapse = ", ")
  paste0("[", x, "]")
}


rm_.DS_Store <- function() {
  sh <- system("find . -name '.DS_Store' -delete", intern = TRUE)
  invisible()
}
